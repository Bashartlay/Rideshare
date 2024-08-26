// hub_model.dart

import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String description;

  const Hub({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory Hub.fromJson(Map<String, dynamic> json) {
    return Hub(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      description: json['description'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, latitude, longitude, description];
}
