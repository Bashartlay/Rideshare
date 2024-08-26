import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/register_model.dart';
import 'package:rideshare/services/auth_service.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  final AuthService authService = AuthService();
  final GetStorage storage = GetStorage();

  void registerUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String username,
    required String birthDate,
    required String password,
    required String confirmPassword,
  }) async {
    isLoading.value = true;

    User newUser = User(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      username: username,
      birthDate: birthDate,
      password: password,
      confirmPassword: confirmPassword,
    );

    final response = await authService.registerUser(newUser);

    if (response.statusCode == 200) {
      storage.write('fullName', '$firstName $lastName');
      storage.write('phone', phone);
      storage.write('email', username);

      var message = response.body['message'];

      if (message is List) {
        message = message.join(', ');
      }

      Get.snackbar('Success', message ?? 'Registration successful');

      Get.toNamed('/profile');
    } else {
      var errorMessage = response.body['message'];

      if (errorMessage is List) {
        errorMessage = errorMessage.join(', ');
      }

      Get.snackbar('Error', errorMessage ?? 'Registration failed');
    }

    isLoading.value = false;
  }
}
