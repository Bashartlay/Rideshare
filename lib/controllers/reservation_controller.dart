import 'package:get/get.dart';
import 'package:rideshare/services/reservation_service.dart';

class ReservationController extends GetxController {
  final ReservationService _reservationService = ReservationService();
  
  Future<void> makeReservation({
    required int bicycleId,
    required int fromHubId,
    required int toHubId,
    required int duration,
    required String startTime,
    required String endTime,
  }) async {
    try {
      await _reservationService.makeReservation(
        bicycleId: bicycleId,
        fromHubId: fromHubId,
        toHubId: toHubId,
        duration: duration,
        startTime: startTime,
        endTime: endTime,
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to make reservation: $e');
    }
  }
}
