import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/resources/static_onboarding.dart';
import 'package:rideshare/view/screen/auth/welcome.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      Get.to(WelcomePage());
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
    print('===================');
    print(index);
    print('===================');
  }

  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }
}
