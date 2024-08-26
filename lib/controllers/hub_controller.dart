// hub_controller.dart

import 'package:get/get.dart';
import 'package:rideshare/model/hub_model.dart';
import 'package:rideshare/services/hub_service.dart';

class HubController extends GetxController {
  final HubService _hubService = HubService();
  var isLoading = false.obs;
  var hubs = <Hub>[].obs;

  var fromHubId = Rxn<int>();
  var toHubId = Rxn<int>();  

  Future<void> fetchNearbyHubs(double latitude, double longitude) async {
    isLoading.value = true;
    try {
      final hubsList = await _hubService.fetchHubsNearby(latitude, longitude);
      hubs.assignAll(hubsList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch nearby hubs: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectFromHub(int hubId) {
    fromHubId.value = hubId;
    Get.snackbar('Info', 'Selected From Hub: $hubId');
  }

  void selectToHub(int hubId) {
    toHubId.value = hubId;
    Get.snackbar('Info', 'Selected To Hub: $hubId');
  }
}
