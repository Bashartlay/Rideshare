import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/resources/app_assets.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/screen/auth/login.dart';
import 'package:rideshare/view/screen/auth/signup.dart';
import 'package:rideshare/view/widgets/buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            const SizedBox(height: 10),
            Image.asset(AppAssets.welcome),
            const Padding(
              padding: EdgeInsets.fromLTRB(60, 60, 60, 10),
              child: Text(
                AppStrings.Welcome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.griyColortitle,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 40),
              child: Text(
                AppStrings.Haveabettersharingexperience,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.griyColor,
                ),
              ),
            ),
            const SizedBox(height: 50),
            PrimaryButton(
              color: AppColors.primarycolor,
              text: AppStrings.Createanaccount,
              onPressed: () {
                Get.to(() => Signup()); 
              },
            ),
            const SizedBox(height: 20),
            DangerButton(
              text: AppStrings.Loigin,
              onPressed: () {
                Get.to(() => LoginPage());  
              },
            )
          ],
        ),
      ),
    );
  }
}
