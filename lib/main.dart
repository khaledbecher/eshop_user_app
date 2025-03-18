import 'package:eshop/common/init_manager/init_manager.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/common/shared_notifiers/orders_notifier.dart';
import 'package:eshop/common/shared_notifiers/theme_notifier.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/common/splash_screen.dart';
import 'package:eshop/common/theme/theme.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/screens/login_screen.dart';
import 'package:eshop/features/authentification/ui/screens/register_screen.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/features/favorites/ui/screens/favorites_screen.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/screens/all_products_screen.dart';
import 'package:eshop/features/home/ui/screens/home_page.dart';
import 'package:eshop/features/home/ui/screens/search_screen_with_filter.dart';
import 'package:eshop/features/settings/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await init();
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool darkTheme = context.watch<ThemeNotifier>().darkTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavigationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritesNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdressesNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme ? AppThemes.darkTheme : AppThemes.lightTheme,
        initialRoute: SplashScreen.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          SearchScreenWithFilter.routeName: (context) =>
              SearchScreenWithFilter(),
          AllProductsScreen.routeName: (context) => AllProductsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          FavoritesScreen.routeName: (context) => FavoritesScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
        },
      ),
    );
  }
}
