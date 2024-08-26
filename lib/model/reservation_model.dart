import 'package:equatable/equatable.dart';

class ReservationModel{
  final int bicycleId;
  final int fromHubId;
  final int toHubId;
  final int duration;
  final String startTime;
  final String endTime;
  final String reservationStatus;
  final String paymentMethod;

  const ReservationModel({
    required this.bicycleId,
    required this.fromHubId,
    required this.toHubId,
    required this.duration,
    required this.startTime,
    required this.endTime,
    this.reservationStatus = 'ok',
    this.paymentMethod = 'Wallet',
  });

  Map<String, dynamic> toJson() {
    return {
      'bicycleId': bicycleId,
      'fromHubId': fromHubId,
      'toHubId': toHubId,
      'duration': duration,
      'startTime': startTime,
      'endTime': endTime,
      'reservationStatus': reservationStatus,
      'paymentMethod': paymentMethod,
    };
  }

  @override
  List<Object?> get props => [
        bicycleId,
        fromHubId,
        toHubId,
        duration,
        startTime,
        endTime,
        reservationStatus,
        paymentMethod,
      ];
}
