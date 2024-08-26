import 'package:get/get.dart';
import 'package:rideshare/model/bicycle_model.dart';
import 'package:rideshare/services/bicycle_service.dart';

class BicycleDetailsController extends GetxController {
  final BicycleService _service = BicycleService();
  var isLoading = false.obs;
  Bicycle? bicycle;

  Future<void> fetchBicycleDetails(int id) async {
    isLoading.value = true;
    try {
      final result = await _service.fetchBicycleById(id);
      if (result != null) {
        bicycle = result;
      } else {
        Get.snackbar('Error', 'Failed to fetch bicycle details');
      }
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
