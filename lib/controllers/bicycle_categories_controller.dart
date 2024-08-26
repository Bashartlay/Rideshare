import 'package:get/get.dart';
import 'package:rideshare/services/bicycle_categories_service.dart';

class BicycleCategoriesController extends GetxController {
  final BicycleCategoriesService _service = BicycleCategoriesService();
  var isLoading = false.obs;
  var categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final result = await _service.fetchBicycleCategories();
      if (result != null) {
        categories.assignAll(result.categories);
      } else {
        Get.snackbar('Error', 'Failed to fetch bicycle categories');
      }
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred: $error');
      print('Fetch categories error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
