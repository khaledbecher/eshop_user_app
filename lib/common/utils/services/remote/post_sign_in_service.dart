import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostLoginService {
  static Future<void> loadUserData(BuildContext context) async {
    final userNotifier = context.read<UserNotifier>();
    final favoritesNotifier = context.read<FavoritesNotifier>();
    final adressNotifier = context.read<AdressesNotifier>();
    final cartNotifier = context.read<CartNotifier>();

    await userNotifier.loadUser();
    favoritesNotifier.loadFavorites();
    adressNotifier.loadAdresses();
    cartNotifier.loadPurchases();
  }
}
