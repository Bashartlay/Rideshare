import 'package:equatable/equatable.dart';

class BicycleCategoriesModel extends Equatable {
  final String message;
  final String status;
  final String localDateTime;
  final List<String> categories;

  const BicycleCategoriesModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.categories,
  });

  factory BicycleCategoriesModel.fromJson(Map<String, dynamic> json) {
    return BicycleCategoriesModel(
      message: json['message'] as String,
      status: json['status'] as String,
      localDateTime: json['localDateTime'] as String,
      categories: List<String>.from(json['body'] as List),
    );
  }

  @override
  List<Object?> get props => [message, status, localDateTime, categories];
}
