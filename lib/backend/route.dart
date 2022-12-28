import 'package:template/backend/param.dart';

class Route {
  const Route({ required this.path, this.params });

  final String path;
  final Map<String, Param>? params;

  bool hasParam() => params != null;

  Param? operator [] (String name) => params?[name];
}