import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/favourite_controller.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/resources/textStyle.dart';

class Favourite extends StatelessWidget {
  final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.Favourite),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.favourites.isEmpty) {
          return const Center(child: Text('No favourite items.'));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.favourites.length,
              itemBuilder: (BuildContext context, int index) {
                final favourite = controller.favourites[index];
                return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
                  child: ListTile(
                    leading: favourite.bicycle.photoPath != null
                        ? Image.network(
                            'https://${favourite.bicycle.photoPath}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.directions_bike,
                            size: 50,
                            color: AppColors.griyColortitle,
                          ),
                    title: Text(
                      favourite.bicycle.modelPrice.model,
                      style: MyTextStyle().myTextStyle(
                          color: AppColors.griyColortitle,
                          size: 18,
                          fontsize: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Price: \$${favourite.bicycle.modelPrice.price}\nType: ${favourite.bicycle.type}',
                      style: MyTextStyle().myTextStyle(
                          color: AppColors.addresscolor,
                          size: 12,
                          fontsize: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever,
                        size: 24,
                        color: AppColors.errorColor,
                      ),
                      onPressed: () {
                        controller.removeFavourite(favourite.id);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
