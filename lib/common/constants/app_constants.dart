import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:eshop/features/favorites/ui/screens/favorites_screen.dart';
import 'package:eshop/features/home/ui/screens/home_page.dart';
import 'package:eshop/features/settings/ui/screens/settings_screen.dart';

class AppConstants {
  static const List<String> navItems = [
    'Home',
    'Favorites',
    'Cart',
    'Settings'
  ];
  static const List<String> routes = [
    HomePage.routeName,
    FavoritesScreen.routeName,
    CartScreen.routeName,
    SettingsScreen.routeName
  ];
  static const int maximalAdressesNumber = 3;
  static const List<String> paymentMethods = [
    'Cash on Delivery',
    'Pay with card'
  ];
  static const double shippingPrice = 17;
  static const List<String> categories = ['Fashion', 'Sports', 'Technology'];
  static const List<String> genders = ['Men', 'Women'];
  static const List<List<dynamic>> subCategories = [
    [
      [
        'shirts',
        'shoes',
        'watches',
      ],
      [
        'bags',
        'dresses',
        'shoes',
        'watches',
      ]
    ],
    [
      'american football',
      'baseball',
      'basketball',
      'cricket',
      'badminton',
      'football',
      'golf',
      'tennis',
      'volleyball'
    ],
    [
      'tablets',
      'smartphones',
      'mobile-accessories',
      'laptops',
    ]
  ];

  static const List<String> orderCategories = [
    'All orders',
    'Pending',
    'Shipped',
    'Delivered'
  ];
}
