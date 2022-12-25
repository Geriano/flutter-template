
import 'package:template/models/model.dart';
import 'package:template/models/user.dart';

class AuthModel extends Model {
  AuthModel(this.token, this.user);

  final String token;
  final UserModel user;

  @override
  Map<String, dynamic> data() => {
    'token': token,
    'user': user,
  };
}