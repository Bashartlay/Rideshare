import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/login_model.dart';
import '../services/login_service.dart';

class LoginController extends GetxController {
  final LoginService loginService = LoginService();
  var isLoading = false.obs;
  final storage = GetStorage(); 

  Future<void> login({required String phone, required String password}) async {
    if (phone.length != 10) {
      Get.snackbar('Error', 'Phone number must be exactly 10 digits long');
      return;
    }

    isLoading.value = true;

    try {
      LoginModel loginModel = LoginModel(phone: phone, password: password);

      final response = await loginService.authenticate(loginModel);

      print('API Response: ${response.body}');

      if (response.statusCode == 200 && response.body['status'] == 'OK') {
        final token = response.body?['body']?['token']; 

        if (token != null) {
          await storage.write('token', token);
          print('Token saved to storage');
          Get.snackbar('Login Successful', 'You have been logged in successfully');
        Get.offAllNamed('/profile');
        } else {
          Get.snackbar('Error', 'Failed to retrieve token');
        }
      } else {
        Get.snackbar('Login Failed', 'Invalid phone number or password');
      }
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred: $error');
      print('Login error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
