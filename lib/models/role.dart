
import 'package:template/models/model.dart';
import 'package:template/models/permission.dart';

class RoleModel extends Model {
  RoleModel({ required this.id, required this.name, required this.permissions });

  final int id;
  final String name;
  final List<PermissionModel> permissions;

  @override
  Map<String, dynamic> data() => {
    'id': id,
    'name': name,
    'permissions': permissions,
  };

  static RoleModel fromJson(Map<String, dynamic> data) {
    List<dynamic> permissions = data['permissions'];

    return RoleModel(
      id: data['id'],
      name: data['name'].toString(),
      permissions: permissions.map((permission) => PermissionModel.fromJson(permission as Map<String, dynamic>)).toList(),
    );
  }
}