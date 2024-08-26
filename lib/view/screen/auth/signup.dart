import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/auth_controller.dart';
import 'package:rideshare/resources/app_assets.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/screen/auth/login.dart';
import 'package:rideshare/view/widgets/buttons.dart';
import 'package:rideshare/view/widgets/textfields.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.Back),
        backgroundColor: AppColors.primarycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.Signupwithyouremail,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: nameController,
                hintText: 'First Name',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: lastNameController,
                hintText: 'Last Name',
              ),
              const SizedBox(height: 15),
              PhoneNumberField(
                controller: phoneController,
                hintText: AppStrings.Yourmobilenumber,
                countryCodes: const ['SY', 'AR'],
                initialCountryCode: 'SY',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: emailController,
                hintText: 'Username',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              DropdownField(
                hintText: AppStrings.Gender,
                initialValue: AppStrings.Gender,
                options: const ['M', "F"],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primarycolor,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      AppStrings.Bysigningup,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: GetBuilder<AuthController>(
                  builder: (_) {
                    return PrimaryButton(
                      color: AppColors.primarycolor,
                      text: AppStrings.SignUp,
                      onPressed: () {
                        if (!authController.isLoading.value) {
                          authController.registerUser(
                            firstName: nameController.text,
                            lastName: lastNameController.text,
                            phone: phoneController.text,
                            username: emailController.text,
                            birthDate: DateTime.now().toIso8601String(),
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildDividerWithText(AppStrings.or),
              const SizedBox(height: 20),
              DanButton(
                text: AppStrings.SignupwithGmail,
                onPressed: () {},
                imageUrl: AppAssets.gmail,
              ),
              const SizedBox(height: 15),
              DanButton(
                text: AppStrings.SignupwithFacebook,
                onPressed: () {},
                imageUrl: AppAssets.facebook,
              ),
              const SizedBox(height: 15),
              DanButton(
                text: AppStrings.SignupwithApple,
                onPressed: () {},
                imageUrl: AppAssets.apple,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.Alreadyhaveanaccount,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.griyColortitle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    child: const Text(
                      AppStrings.Signin,
                      style: TextStyle(
                        color: AppColors.primarycolor,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return PrimaryTextField(
      controller: controller,
      hintText: hintText,
      obscureText: obscureText,
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: AppColors.griyColor,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: AppColors.griyColor),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.griyColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
