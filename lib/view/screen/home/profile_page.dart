import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/screen/home/home_screen.dart';
import 'package:rideshare/view/widgets/buttons.dart';
import 'package:rideshare/view/widgets/textfields.dart';
import 'package:rideshare/view/screen/auth/welcome.dart';

class Profile extends StatelessWidget {
  final bool showLogout;

  const Profile({super.key, this.showLogout = false});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();

    TextEditingController fullNameController =
        TextEditingController(text: storage.read('fullName') ?? '');
    TextEditingController numberController =
        TextEditingController(text: storage.read('phone') ?? '');
    TextEditingController emailController =
        TextEditingController(text: storage.read('email') ?? '');
    TextEditingController streetController =
        TextEditingController(text: storage.read('street') ?? '');

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.Profile), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30, width: double.infinity),
              Stack(
                children: <Widget>[
                  Container(
                    width: 121,
                    height: 121,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.hintTextFormColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textGreenColo,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 22,
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              PrimaryTextField(
                controller: fullNameController,
                hintText: AppStrings.FullName,
              ),
              const SizedBox(height: 20),
              PhoneNumberField(
                controller: numberController,
                hintText: AppStrings.Yourmobilenumber,
                countryCodes: const ['SY'],
                initialCountryCode: 'SY',
              ),
              const SizedBox(height: 20),
              PrimaryTextField(
                controller: emailController,
                hintText: AppStrings.Email,
              ),
              const SizedBox(height: 20),
              PrimaryTextField(
                controller: streetController,
                hintText: AppStrings.Street,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SecondaryBut(
                      text: AppStrings.Cancel,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SecondaryButton(
                      text: AppStrings.Save,
                      onPressed: () {
                        storage.write('fullName', fullNameController.text);
                        storage.write('phone', numberController.text);
                        storage.write('email', emailController.text);
                        storage.write('street', streetController.text);
                        Get.snackbar(
                          'Profile',
                          'Profile updated successfully',
                        );
                        Get.off(() => const MapPage()); 
                      },
                    ),
                  ),
                ],
              ),
              if (showLogout) ...[
                const SizedBox(height: 20),
                DangerButton(
                  text: 'Logout',
                  onPressed: () {
                    storage.remove('token');
                    Get.offAll(() => const WelcomePage());
                  },
                ),
              ],
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
