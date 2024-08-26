import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/reservation_model.dart';

class ReservationService extends GetConnect {
  Future<void> makeReservation({
    required int bicycleId,
    required int fromHubId,
    required int toHubId,
    required int duration,
    required String startTime,
    required String endTime,
  }) async {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    if (token == null) {
      Get.snackbar('Error', 'User token not found. Please login again.');
      return;
    }

    ReservationModel res = ReservationModel(
      bicycleId: bicycleId,
      fromHubId: fromHubId,
      toHubId: toHubId,
      duration: duration,
      startTime: startTime,
      endTime: endTime,
      reservationStatus: "ok",
      paymentMethod: "Wallet"
    );
    
    final response = await post(
      'https://rideshare.devscape.online/api/v1/reservation',
      res.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Token: $token');

    print('Response Body: ${response.body}');

    print('Response Headers: ${response.headers}');

    print('Status Code: ${response.statusCode}');

    if (response.status.hasError) {
      Get.snackbar('Error', response.body['message'] ?? 'Failed to make reservation');
    } else {
      Get.snackbar('Success', response.body['message'] ?? 'Reservation made successfully');
    }
  }
}
