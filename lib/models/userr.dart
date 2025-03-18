import 'package:eshop/models/adress.dart';

class Userr {
  List? favorites;
  List? cartItems;
  List<Adress>? adresses;
  String? email;
  String? userName;
  String? dateOfBirth;
  String? phoneNumber;

  Userr() {
    this.favorites = [];
    this.cartItems = [];
    this.adresses = [];
    this.email = '';
    this.userName = '';
    this.phoneNumber = '';
    this.dateOfBirth = '';
  }

  Userr.fromJson(json) {
    this.favorites = json['favorites'];
    this.cartItems = json['cartItems'];
    this.adresses = (json['adresses'] as List)
        .map((adress) => Adress.fromJson(adress))
        .toList();

    this.email = json['email'];
    this.userName = json['userName'];
    this.dateOfBirth = json['dateOfBirth'];
    this.phoneNumber = json['phoneNumber'];
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'favorites': favorites,
      'cartItems': cartItems,
      'adresses': adresses!.isNotEmpty
          ? adresses!.map((adress) => adress.toJson()).toList()
          : adresses,
      'email': email,
      'userName': userName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
    };
  }
}
