import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/resources/app_strings.dart';

class DialogEnabelController extends GetxController {
  void showAlertDialog() {
    Get.defaultDialog(
      content: Column(
        children: [
          const Icon(Icons.add),
          const Text(AppStrings.Enableyourlocation),
          const Text(AppStrings.Chooseyourlocationtostart),
          ElevatedButton(
              onPressed: () {
                // Get.to(Onboarding());
              },
              child: const Text("moha")),
          const Text(AppStrings.Skipfornow),
        ],
      ),
    );
  }
}
