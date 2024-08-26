// hub_service.dart

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/hub_model.dart';

class HubService extends GetConnect {
  Future<List<Hub>> fetchHubsNearby(double latitude, double longitude) async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return [];
    }

    final response = await get(
      'https://rideshare.devscape.online/api/v1/hubs?longtitude=$longitude&latitude=$latitude',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.hasError) {
      Get.snackbar('Error', 'Failed to fetch hubs');
      return [];
    } else {
      List<dynamic> body = response.body['body'];
      return body.map((item) => Hub.fromJson(item)).toList();
    }
  }

  Future<void> sendHubSelection(int hubId) async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return;
    }

    final response = await post(
      'https://rideshare.devscape.online/api/v1/hubs/select',
      {'hub_id': hubId},
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.hasError) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.bodyString}');
      Get.snackbar('Error', 'Failed to select hub: ${response.bodyString}');
    } else {
      Get.snackbar('Success', 'Hub selected successfully');
    }
  }
}
