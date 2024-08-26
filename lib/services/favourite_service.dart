import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/model/favourite_bicycle_model.dart';

class FavouriteService extends GetConnect {
  final storage = GetStorage();

  Future<List<FavouriteBicycle>> getFavouriteBicycles() async {
    final token = storage.read('token');
    final response = await get(
      'https://rideshare.devscape.online/api/v1/favourite-bicycles/clientFavourite',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.status.hasError) {
      throw Exception('Failed to load favourites');
    } else {
      final List<dynamic> body = response.body['body'];
      return body.map((item) => FavouriteBicycle.fromJson(item)).toList();
    }
  }

  Future<FavouriteBicycle> addFavourite(int bicycleId) async {
    final token = storage.read('token');
    final response = await post(
      'https://rideshare.devscape.online/api/v1/favourite-bicycles',
      {'bicycleId': bicycleId},
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.status.hasError) {
      throw Exception('Failed to add favourite');
    } else {
      return FavouriteBicycle.fromJson(response.body['body']);
    }
  }

  Future<void> removeFavourite(int favouriteId) async {
    final token = storage.read('token');
    final response = await delete(
      'https://rideshare.devscape.online/api/v1/favourite-bicycles/$favouriteId',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.status.hasError) {
      throw Exception('Failed to remove favourite');
    }
  }
}
