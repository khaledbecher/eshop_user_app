import 'package:eshop/features/favorites/data/services/remote/favorites_service.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/cupertino.dart';

class FavoritesNotifier with ChangeNotifier {
  List _favorites = [];
  List get favorites => _favorites;

  void addFavorite(Product favorite) {
    FavoritesService.addFavorite(favorite.id!);
    if (!_favorites.any((element) => element.id == favorite.id)) {
      _favorites = [..._favorites, favorite];
    }
    notifyListeners();
  }

  void removeFavorite(Product favorite) {
    if (favorites.any((favorite) => favorite.id == favorite.id)) {
      FavoritesService.removeFavorite(favorite.id!);
    }
    _favorites = _favorites.where((item) => item.id != favorite.id).toList();

    notifyListeners();
  }

  Future<List<Product>> fetchfavorites() async {
    final response = await FavoritesService.fetchFavorites();
    List<Product> favorites =
        response.map((product) => Product.fromJson(product)).toList();
    return favorites;
  }

  void loadFavorites() async {
    _favorites = await fetchfavorites();
    notifyListeners();
  }

  void clearFavorites() {
    _favorites = [];
    notifyListeners();
  }
}
