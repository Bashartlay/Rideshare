import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/bicycle_categories_model.dart';

class BicycleCategoriesService extends GetConnect {
  final String baseUrl = 'https://rideshare.devscape.online/api/v1';

  Future<BicycleCategoriesModel?> fetchBicycleCategories() async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return null;
    }

    final response = await get(
      '/bicycle/bicycles-categories',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
// print(response.status.hasError);
    if (response.status.hasError) {
      Get.snackbar('Error', 'Failed to fetch bicycle categories');
      return null;
    } else {
      return BicycleCategoriesModel.fromJson(response.body);
    }
  }
}
