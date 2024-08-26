import 'package:get/get.dart';
import 'package:rideshare/model/bicycle_model.dart';
import 'package:rideshare/services/bicycle_service.dart';

class BicycleController extends GetxController {
  final String category;
  final BicycleService _service = BicycleService();
  var isLoading = false.obs;
  var bicycles = <Bicycle>[].obs;
  var favorites = <Bicycle>[].obs; // قائمة لتخزين البسكليتات المفضلة

  BicycleController(this.category);

  @override
  void onInit() {
    super.onInit();
    fetchBicycles();
  }

  Future<void> fetchBicycles() async {
    isLoading.value = true;
    try {
      final result = await _service.fetchBicyclesByCategory(category);
      bicycles.assignAll(result);
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred: $error');
      print('Fetch bicycles error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(Bicycle bicycle) {
    if (favorites.contains(bicycle)) {
      favorites.remove(bicycle);
    } else {
      favorites.add(bicycle);
    }
  }
}
