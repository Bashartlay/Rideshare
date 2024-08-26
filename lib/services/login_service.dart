import 'package:get/get.dart';
import 'package:rideshare/model/login_model.dart';

class LoginService extends GetConnect {
  Future<Response> authenticate(LoginModel loginModel) async {
    final response = await post(
      'https://rideshare.devscape.online/api/v1/auth/authenticate',
      loginModel.toJson(),
    );
    return response;
  }
}
