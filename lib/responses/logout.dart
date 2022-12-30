import 'package:template/responses/response.dart';

class LogoutSuccessResponse extends Response {
  LogoutSuccessResponse({ required this.message });
  
  final String message;
}