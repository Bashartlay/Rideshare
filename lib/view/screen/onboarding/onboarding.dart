import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/onboarding_controller.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/resources/static_onboarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.skip),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: GetBuilder<OnboardingControllerImp>(
                init: OnboardingControllerImp(),
                builder: (controller) => PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (val) {
                      controller.onPageChanged(val);
                    },
                    itemCount: onboardingList.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(height: 10),
                            Image.asset(
                              onboardingList[index].image!,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(60, 60, 60, 10),
                              child: Text(onboardingList[index].title!,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.griyColortitle)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(60, 10, 60, 40),
                              child: Text(onboardingList[index].content!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.griyColor)),
                            ),
                          ],
                        )),
              )),
          Expanded(
              child: Column(
            children: [
              GetBuilder<OnboardingControllerImp>(
                init: OnboardingControllerImp(),
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      onboardingList.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 900),
                        width: controller.currentPage == i ? 20 : 6,
                        height: 6,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColors.primarycolor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<OnboardingControllerImp>(
                init: OnboardingControllerImp(),
                builder: (controller) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textGreenColo),
                  child: IconButton(
                    onPressed: () {
                      controller.next();
                    },
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 40,
                      color: AppColors.griyColortitle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ))
        ],
      ),
    );
  }
}
