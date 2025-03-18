import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/utils/interaction_utils/toasts/toast_utils.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/common/utils/services/remote/adresses_service.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';

class AdressesNotifier with ChangeNotifier {
  List<Adress> _adresses = [];

  int _adressIndex = 0;

  List<Adress> get adresses => _adresses;

  int get adressIndex => _adressIndex;

  void loadAdresses() async {
    final List adressesJson = await AdressesService.fetchAdresses();
    _adresses = adressesJson.map((adress) => Adress.fromJson(adress)).toList();
    notifyListeners();
  }

  void addAdress(Adress adress, ThemeData theme) {
    if (_adresses.length == AppConstants.maximalAdressesNumber) {
      showErrorToast(
          msg: 'You have reached the maximum adresses number !',
          backgroundColor: theme.colorScheme.onSecondaryFixed);
    } else {
      AdressesService.addAdress(adress);
      if (!_adresses.any((element) => equalAdresses(element, adress))) {
        _adresses = [..._adresses, adress];
        _adressIndex = _adresses.length - 1;
      } else {
        showErrorToast(
            msg: 'this adress already exists !',
            backgroundColor: theme.colorScheme.onSecondaryFixed);
      }
      notifyListeners();
    }
  }

  void removeAdress(Adress adress) {
    if (_adresses.any((element) => equalAdresses(element, adress))) {
      AdressesService.removeAdress(adress);
    }
    _adresses =
        _adresses.where((item) => !equalAdresses(item, adress)).toList();
    _adressIndex = _adresses.length - 1;

    notifyListeners();
  }

  void editAdress(Adress oldAdress, Adress newAdress, ThemeData theme) async {
    if (_adresses.any((element) => equalAdresses(element, oldAdress))) {
      await AdressesService.editAdress(oldAdress, newAdress);
      int index =
          _adresses.indexWhere((element) => equalAdresses(element, oldAdress));
      _adresses = List.from(_adresses);
      _adresses[index] = newAdress;
      notifyListeners();
    } else {
      showErrorToast(
        msg: 'Address not found!',
        backgroundColor: theme.colorScheme.onSecondaryFixed,
      );
    }
  }

  void changeAdressIndex(int newIndex) {
    _adressIndex = newIndex;
    notifyListeners();
  }

  void clearAdresses() {
    _adresses = [];
    _adressIndex = 0;
    notifyListeners();
  }
}
