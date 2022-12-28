import 'package:flutter/material.dart';
import 'package:template/backend/pagination_param.dart';
import 'package:template/backend/services.dart';
import 'package:template/services.dart';

void validateGivenServiceRouteAndParam(String service, String route, Map<String, dynamic>? params) {
  if (!services.has(service)) {
    throw ErrorDescription('Service [$service] is not exists');
  }

  if (!services[service]!.has(route)) {
    throw ErrorDescription('Route [$route] on service [$service] is not exists');
  }

  if (!services[service]![route]!.hasParam()) {
    return;
  }

  for (var key in services[service]![route]!.params!.keys) {
    final parameter = services[service]![route]!.params![key]!;

    if (parameter.required && (params == null || !params.containsKey(key))) {
      throw ErrorDescription('Missing parameter [$key] for route [$route] on service [$service]');
    }
  }
}

Uri route({ required String service, required String route, Map<String, dynamic>? params }) {
  validateGivenServiceRouteAndParam(service, route, params);

  final s = services[service]!;
  final r = s[route]!;
  final p = r.params;

  final hostname = s.hostname ?? services.hostname;
  final path = r.path;
  String fullpath = '/${services.prefix}/${s.prefix}/$path'.replaceAll(RegExp(r'/+'), '/');

  Map<String, String> queries = {};
  Map<String, String> bindings = {};

  final regex = RegExp(r'\{([a-zA-Z]+)\}');
  regex.allMatches(fullpath).forEach((match) {
    final key = match.group(1);

    if (key != null && params != null && params.containsKey(key)) {
      bindings[key] = params[key].toString();
      params.remove(key);
    } else {
      throw ErrorDescription('Missing url binding [$key] for route [$route] in service [$service]');
    }
  });

  for (var key in bindings.keys) {
    fullpath = fullpath.replaceAll('{$key}', bindings[key]!);
  }

  if (p != null) {
    for (var key in p.keys) {
      if (bindings.keys.contains(key)) {
        continue;
      }

      var value = params![key]!;

      if (value is Enum) {
        value = value.name;
      } else {
        value = value.toString();
      }

      queries[key] = value;
      params?.remove(key);
    }
  }

  if (params != null && params.isNotEmpty) {
    for (var key in [...params.keys]) {
      var value = params![key]!;

      if (value is Enum) {
        value = value.name;
      } else {
        value = value.toString();
      }

      queries[key] = value;
      params?.remove(key);
    }
  }

  return services.scheme == Scheme.https ?
          Uri.https(hostname, fullpath, queries.isEmpty ? null : queries) :
          Uri.http(hostname, fullpath, queries.isEmpty ? null : queries);
}