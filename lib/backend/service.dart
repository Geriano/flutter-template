import 'package:template/backend/route.dart';

class Service {
  const Service({ required this.routes, this.hostname, this.prefix });

  final Map<String, Route> routes;
  final String? hostname;
  final String? prefix;

  bool has(String key) => routes.containsKey(key);

  Route? operator [] (String name) => routes[name];
}