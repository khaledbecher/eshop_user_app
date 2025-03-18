import 'package:flutter/cupertino.dart';

class NavigationNotifier with ChangeNotifier {
  int _navItemIndex = 0;
  int _navPreviousIndex = 0;
  int _doublePreviousIndex = 0;
  int _triplePreviousIndex = 0;

  int get navItemIndex => _navItemIndex;

  int get doublePreviousIndex => _doublePreviousIndex;

  int get triplePreviousIndex => _triplePreviousIndex;

  int get navPreviousIndex => _navPreviousIndex;

  void changeNavItemIndex(int newIndex) {
    if (newIndex != _navItemIndex) {
      _triplePreviousIndex = _doublePreviousIndex;
      _doublePreviousIndex = _navPreviousIndex;
      _navPreviousIndex = _navItemIndex;
      _navItemIndex = newIndex;
      notifyListeners();
    }
  }

  void returnBack() {
    _navItemIndex = _navPreviousIndex;
    _navPreviousIndex = _doublePreviousIndex;
    _doublePreviousIndex = _triplePreviousIndex;
    _triplePreviousIndex = 0;
    notifyListeners();
  }

  void clear() {
    _navItemIndex = 0;
    _navPreviousIndex = 0;
    _doublePreviousIndex = 0;
    _triplePreviousIndex = 0;
    notifyListeners();
  }
}
