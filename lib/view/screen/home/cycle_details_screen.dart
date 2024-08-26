import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/bicycle_details_controller.dart';
import 'package:rideshare/controllers/favourite_controller.dart';
import 'package:rideshare/controllers/reservation_controller.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/resources/textStyle.dart';
import 'package:rideshare/view/widgets/buttons.dart';
import 'package:rideshare/view/widgets/listtile.dart';

class CycleDetails extends StatelessWidget {
  final int bicycleId;
  final int fromHubId;
  final int toHubId;

  const CycleDetails(
      {super.key,
      required this.bicycleId,
      required this.fromHubId,
      required this.toHubId});

  @override
  Widget build(BuildContext context) {
    final BicycleDetailsController controller =
        Get.put(BicycleDetailsController());
    final ReservationController reservationController =
        Get.put(ReservationController());
    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    controller.fetchBicycleDetails(bicycleId);

    void _showReservationDialog() {
      final durationController = TextEditingController();
      final startTimeController =
          TextEditingController(text: DateTime.now().toIso8601String());
      final endTimeController = TextEditingController(
          text: DateTime.now().add(Duration(minutes: 50)).toIso8601String());

      Get.defaultDialog(
        title: 'Enter Reservation Details',
        content: Column(
          children: [
            TextField(
              controller: durationController,
              decoration:
                  const InputDecoration(labelText: 'Duration (minutes)'),
            ),
            TextField(
              controller: startTimeController,
              decoration: const InputDecoration(
                  labelText: 'Start Time (YYYY-MM-DDTHH:MM:SS)'),
            ),
            TextField(
              controller: endTimeController,
              decoration: const InputDecoration(
                  labelText: 'End Time (YYYY-MM-DDTHH:MM:SS)'),
            ),
          ],
        ),
        textConfirm: 'Confirm',
        onConfirm: () {
          final duration = int.tryParse(durationController.text) ??
              50; 

          print("Bicycle ID: $bicycleId");
          print("From Hub ID: $fromHubId");
          print("To Hub ID: $toHubId");
          print("Duration: ${durationController.text}");
          print("Start Time: ${startTimeController.text}");
          print("End Time: ${endTimeController.text}");

          reservationController.makeReservation(
            bicycleId: bicycleId,
            fromHubId: fromHubId,
            toHubId: toHubId,
            duration: duration,
            startTime: startTimeController.text,
            endTime: endTimeController.text,
          );
          Get.back();
        },
        textCancel: 'Cancel',
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.Back)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.bicycle == null) {
          return const Center(child: Text('No bicycle details available'));
        } else {
          final bicycle = controller.bicycle!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        'https://${bicycle.photoPath}',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: Obx(() {
                          final isFavorite =
                              favouriteController.isFavorite(bicycleId);
                          return IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 30,
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                favouriteController.removeFavourite(bicycleId);
                              } else {
                                favouriteController.addFavourite(bicycleId);
                              }
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bicycle.modelPrice.model,
                    style: const TextStyle(
                        color: AppColors.addresscolortitle,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 22,
                        color: AppColors.goledColor,
                      ),
                      SizedBox(width: 20),
                      Text(
                        '4.9 (531 reviews)',
                        style: TextStyle(
                            color: AppColors.addresscolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Specifications',
                      style: MyTextStyle().myTextStyle(
                          color: AppColors.addresscolortitle,
                          fontsize: FontWeight.w500,
                          size: 18)),
                  Row(
                    children: [
                      ContainerDetails(
                        icon: Icons.battery_charging_full_rounded,
                        containt: '${bicycle.size}', 
                        title: 'Size',
                      ),
                      ContainerDetails(
                        icon: Icons.monetization_on,
                        containt: '\$${bicycle.modelPrice.price}',
                        title: 'Price',
                      ),
                      ContainerDetails(
                        icon: Icons.category,
                        containt: bicycle.type, 
                        title: 'Type',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Cycle features',
                      style: MyTextStyle().myTextStyle(
                          color: AppColors.addresscolortitle,
                          fontsize: FontWeight.w500,
                          size: 18)),
                  Column(
                    children: [
                      CarFeaturesdetails(
                        title: 'Model',
                        containt: bicycle.modelPrice.model,
                      ),
                      CarFeaturesdetails(
                        title: 'Note',
                        containt:
                            bicycle.note.isEmpty ? 'No notes' : bicycle.note,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SecondaryBut(
                          text: AppStrings.Booklater,
                          onPressed:
                              _showReservationDialog,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SecondaryButton(
                          text: AppStrings.RideNow,
                          onPressed:
                              _showReservationDialog,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
