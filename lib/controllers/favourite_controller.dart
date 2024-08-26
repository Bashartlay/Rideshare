import 'package:get/get.dart';
import 'package:rideshare/model/favourite_bicycle_model.dart';
import 'package:rideshare/services/favourite_service.dart';

class FavouriteController extends GetxController {
  final FavouriteService service = FavouriteService();
  var favourites = <FavouriteBicycle>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavourites();
  }

  void fetchFavourites() async {
    isLoading.value = true;
    try {
      favourites.value = await service.getFavouriteBicycles();
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(int bicycleId) {
    return favourites.any((favourite) => favourite.bicycle.id == bicycleId);
  }

  void addFavourite(int bicycleId) async {
    try {
      await service.addFavourite(bicycleId);
      fetchFavourites();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add to favourites');
    }
  }

  void removeFavourite(int bicycleId) async {
    try {
      final favourite = favourites.firstWhere((f) => f.bicycle.id == bicycleId);
      await service.removeFavourite(favourite.id);
      fetchFavourites();
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove from favourites');
    }
  }
}
