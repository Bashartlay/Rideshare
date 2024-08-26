import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/bicycle_model.dart';

class BicycleService extends GetConnect {
  final String baseUrl = 'https://rideshare.devscape.online/api/v1';

  Future<List<Bicycle>> fetchBicyclesByCategory(String category) async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return [];
    }

    final response = await get(
      '/bicycle/bicycles-by-category?category=$category',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.hasError) {
      Get.snackbar('Error', 'Failed to fetch bicycles');
      return [];
    } else {
      List<dynamic> body = response.body['body'];
      return body.map((item) => Bicycle.fromJson(item)).toList();
    }
  }

 Future<Bicycle?> fetchBicycleById(int id) async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return null;
    }
    final response = await get(
      '/bicycle/$id',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
   print(response.statusCode);
    if (response.status.hasError) {
      Get.snackbar('Error', 'Failed to fetch bicycle details');
      return null;
    } else {
      return Bicycle.fromJson(response.body['body']);
    }
  
}
  
}
