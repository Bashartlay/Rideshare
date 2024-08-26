import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/login_controller.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/screen/auth/signup.dart';
import 'package:rideshare/view/widgets/textfields.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: AppColors.primarycolor,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login to Your Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              PhoneNumberField(
                controller: phoneController,
                hintText: 'Your mobile number',
                countryCodes: const ['SY', 'AR'],
                initialCountryCode: 'SY',
              ),
              const SizedBox(height: 15),
              PrimaryTextField(
                // isPasswordField: true,
                controller: passwordController,
                hintText: 'Password',
               obscureText: true,
              ),
              const SizedBox(height: 20),
              Center(
                child: GetBuilder<LoginController>(
                  builder: (_) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:   AppColors.primarycolor,

                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                      ),
                      onPressed: () async {
                        if (!loginController.isLoading.value) {
                          await loginController
                              .login(
                            phone: phoneController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child:
                            const Text(AppStrings.Loigin, style: TextStyle(fontSize: 16,color: AppColors.whiteColor)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.Donthaveanaccount,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => Signup());
                    },
                    child:   const Text(
                      AppStrings.SignUp,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
