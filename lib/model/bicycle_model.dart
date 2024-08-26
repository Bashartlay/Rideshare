import 'package:equatable/equatable.dart';

class Bicycle extends Equatable {
  final int id;
  final ModelPrice modelPrice;
  final int size;
  final String photoPath;
  final String type;
  final String note;

  const Bicycle({
    required this.id,
    required this.modelPrice,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) {
    return Bicycle(
      id: int.parse(json['id'].toString()), 
      modelPrice: ModelPrice.fromJson(json['model_price']),
      size: int.parse(json['size'].toString()),
      photoPath: json['photoPath'] as String,
      type: json['type'] as String,
      note: json['note'] as String,
    );
  }

  @override
  List<Object?> get props => [id, modelPrice, size, photoPath, type, note];
}

class ModelPrice extends Equatable {
  final int id;
  final double price;
  final String model;

  const ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  factory ModelPrice.fromJson(Map<String, dynamic> json) {
    return ModelPrice(
      id: int.parse(json['id'].toString()), 
      price: (json['price'] as num).toDouble(), 
      model: json['model'] as String,
    );
  }

  @override
  List<Object?> get props => [id, price, model];
}
