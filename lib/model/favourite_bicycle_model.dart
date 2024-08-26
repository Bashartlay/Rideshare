class FavouriteBicycle {
  final int id;
  final Bicycle bicycle;
  final Client client;

  FavouriteBicycle({
    required this.id,
    required this.bicycle,
    required this.client,
  });

  factory FavouriteBicycle.fromJson(Map<String, dynamic> json) {
    return FavouriteBicycle(
      id: json['id'],
      bicycle: Bicycle.fromJson(json['bicycle']),
      client: Client.fromJson(json['client']),
    );
  }
}

class Bicycle {
  final int id;
  final ModelPrice modelPrice;
  final int size;
  final String? photoPath;
  final String type;
  final String note;

  Bicycle({
    required this.id,
    required this.modelPrice,
    required this.size,
    this.photoPath,
    required this.type,
    required this.note,
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) {
    return Bicycle(
      id: json['id'],
      modelPrice: ModelPrice.fromJson(json['model_price']),
      size: json['size'],
      photoPath: json['photoPath'],
      type: json['type'],
      note: json['note'],
    );
  }
}
class ModelPrice {
  final int id;
  final int price; 
  final String model;

  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  factory ModelPrice.fromJson(Map<String, dynamic> json) {
    return ModelPrice(
      id: json['id'],//
      price: json['price'].round(), 
      model: json['model'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'model': model,
    };
  }
}

class Client {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String username;
  final String birthDate;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.username,
    required this.birthDate,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      username: json['username'],
      birthDate: json['birthDate'],
    );
  }
}
