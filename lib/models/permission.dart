

import 'package:template/models/model.dart';

class PermissionModel extends Model {
  PermissionModel({ required this.id, required this.name });

  final int id;
  final String name;

  @override
  Map<String, dynamic> data() => {
    'id': id,
    'name': name,
  };

  static PermissionModel fromJson(Map<String, dynamic> data) => PermissionModel(
    id: data['id'], 
    name: data['name'].toString(),
  );
}