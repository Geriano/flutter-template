
import 'package:template/models/model.dart';
import 'package:template/models/permission.dart';
import 'package:template/models/role.dart';

class UserModel extends Model {
  UserModel({ required this.id, required this.name, required this.email, required this.username, required this.profilePhotoUrl, required this.roles, required this.permissions });

  final int id;
  final String name;
  final String email;
  final String username;
  final String profilePhotoUrl;
  final List<RoleModel> roles;
  final List<PermissionModel> permissions;

  @override
  Map<String, dynamic> data() => {
    'id': id,
    'name': name,
    'email': email,
    'username': username,
    'profile_photo_url': profilePhotoUrl,
    'roles': roles,
    'permissions': permissions,
  };

  static UserModel fromJson(Map<String, dynamic> data) {
    List<dynamic> roles = data['roles'];
    List<dynamic> permissions = data['permissions'];

    return UserModel(
      id: data['id'], 
      name: data['name'], 
      email: data['email'], 
      username: data['username'], 
      profilePhotoUrl: data['profile_photo_url'], 
      roles: roles.map((role) => RoleModel.fromJson(role as Map<String, dynamic>)).toList(), 
      permissions: permissions.map((permission) => PermissionModel.fromJson(permission as Map<String, dynamic>)).toList(),
    );
  }
}