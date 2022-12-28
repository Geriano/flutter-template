import 'package:template/backend/service.dart';

enum Scheme {
  http,
  https,
}

class Services {
  const Services({ required this.services, required this.scheme, required this.hostname, this.prefix });

  final Map<String, Service> services;
  final Scheme scheme;
  final String hostname;
  final String? prefix;

  bool has(String key) => services.containsKey(key);

  Service? operator [] (String name) => services[name];
}