import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    // Initialize theme based on device settings
    initializeTheme();
  }

  void initializeTheme() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    _darkTheme = brightness == Brightness.dark;
  }

  void toggleDarkTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
