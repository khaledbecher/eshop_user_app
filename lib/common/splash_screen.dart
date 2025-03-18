import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/screens/login_screen.dart';
import 'package:eshop/features/home/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authNotifier = context.read<AuthNotifier>();
    return AnimatedSplashScreen(
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      splash: Center(
        child: Container(
          child: Image.asset(
            'assets/images/app_logo.png',
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
          ),
          height: 300,
          width: 300,
        ),
      ),
      nextScreen: authNotifier.isAuthentified(context)?HomePage():LoginScreen(),
      duration: 3000,
      splashIconSize: 500,
    );
  }
}
