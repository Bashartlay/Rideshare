// lib/services/auth_service.dart

import 'package:get/get.dart';
import 'package:rideshare/model/register_model.dart';

class AuthService extends GetConnect {
  Future<Response> registerUser(User user) async {
    final response = await post(
      'https://rideshare.devscape.online/api/v1/auth/register',
      user.toJson(),
    );
    return response;
  }
}
