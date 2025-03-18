import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostLogoutService {
  static Future<void> clearUserData(BuildContext context) async {
    final userNotifier = context.read<UserNotifier>();
    final favoritesNotifier = context.read<FavoritesNotifier>();
    final adressNotifier = context.read<AdressesNotifier>();
    final navigationNotifier = context.read<NavigationNotifier>();

    await userNotifier.clearUser();
    favoritesNotifier.clearFavorites();
    adressNotifier.clearAdresses();
    navigationNotifier.clear();
  }
}
