import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/bicycle_controller.dart';
import 'package:rideshare/resources/app_colors.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/screen/home/cycle_details_screen.dart';
import 'package:rideshare/view/widgets/listtile.dart';

class SelectAvaiableCar extends StatelessWidget {
  final String category;
  final int fromHubId;
  final int toHubId;  

  const SelectAvaiableCar({
    required this.category,
    required this.fromHubId, 
    required this.toHubId,  
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BicycleController controller = Get.put(BicycleController(category));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.Selecttransport),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.bicycles.isEmpty) {
          return const Center(child: Text('No bicycles available'));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  AppStrings.Avaiablecarsforride,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.addresscolortitle,
                  ),
                ),
                Text(
                  '${controller.bicycles.length} ${AppStrings.Cyclefound}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.addresscolor,
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.bicycles.length,
                    itemBuilder: (context, index) {
                      final bicycle = controller.bicycles[index];
                      return ListtileAvaiableCycle(
                        onPressed: () {
                          Get.to(() => CycleDetails(
                            bicycleId: bicycle.id,
                            fromHubId: fromHubId, 
                            toHubId: toHubId,   
                          ));
                        },
                        cycleName: bicycle.modelPrice.model,
                        cycleDetails:
                            'Size: ${bicycle.size} | Price: \$${bicycle.modelPrice.price}',
                        imageUrl: 'https://${bicycle.photoPath}',
                        note: bicycle.note,
                        type: bicycle.type,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
