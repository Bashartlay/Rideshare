import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/controllers/bicycle_categories_controller.dart';
import 'package:rideshare/view/screen/home/avaiable_cycle.dart';
import 'package:rideshare/view/widgets/listtile.dart';

class SelectTransport extends StatelessWidget {
  SelectTransport({super.key});

  final BicycleCategoriesController controller =
      Get.put(BicycleCategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Transport'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.categories.isEmpty) {
          return const Center(child: Text('No categories available'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: controller.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return ContainerTransportGridview(
                  onTap: () {
                    _selectHubsAndNavigate(context, category);
                  },
                  imageUrl: 'assets/images/cycle.png',
                  name: category.replaceAll('_', ' '),
                );
              },
            ),
          );
        }
      }),
    );
  }

  void _selectHubsAndNavigate(BuildContext context, String category) {
    int fromHubId = 1; 
    int toHubId = 2;  

    Get.to(() => SelectAvaiableCar(
      category: category,
      fromHubId: fromHubId,
      toHubId: toHubId,
    ));
  }
}

class ContainerTransportGridview extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;

  const ContainerTransportGridview({
    required this.imageUrl,
    required this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50], 
          borderRadius: BorderRadius.circular(15), 
          border: Border.all(
            color: Colors.green,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
