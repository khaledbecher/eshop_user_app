import 'package:eshop/models/adress.dart';
import 'package:eshop/models/order.dart';
import 'package:eshop/models/purchase.dart';
import 'package:flutter/material.dart';

Color availabilityColor(String availability) {
  Color color = Colors.white;
  switch (availability) {
    case 'In Stock':
      color = Colors.green;
    case 'Low Stock':
      color = Colors.blueAccent;
    case 'Out of Stock':
      color = Colors.red;
  }
  return color;
}

String getAvailibility(int stock) {
  if (stock > 20) {
    return 'In Stock';
  } else if (stock == 0) {
    return 'Out of Stock';
  } else {
    return 'Low Stock';
  }
}

double calculateDiscountedPrice(double price, double discount) {
  return price - (price * discount / 100);
}

bool equalAdresses(Adress first, Adress second) {
  return (first.title == second.title &&
      first.postalCode == second.postalCode &&
      first.city == second.city &&
      first.country == second.country &&
      first.houseNumber == second.houseNumber &&
      first.street == second.street);
}

bool mapsAreEqual(Map<String, dynamic> map1, Map<String, dynamic> map2) {
  if (map1.length != map2.length) return false;
  for (var key in map1.keys) {
    if (!map2.containsKey(key) || map1[key] != map2[key]) {
      return false;
    }
  }
  return true;
}

List<Purchase> jsonPurchasesToPurchases(List jsonPurchases) {
  List purchases = jsonPurchases
      .map((jsonPurchase) => Purchase.fromJson(jsonPurchase))
      .toList();
  return purchases as List<Purchase>;
}

List<Map<String, dynamic>> purchasesToJsonPurchases(List<Purchase> purchases) {
  List jsonPurchases = purchases.map((purchase) => purchase.toJson()).toList();
  return jsonPurchases as List<Map<String, dynamic>>;
}

List<Map<String, dynamic>> purchasesToFirebasePurchases(
    List<Purchase> purchases) {
  List firebasePurchases = purchases.map((purchase) {
    return {'product': purchase.product!.id, 'quantity': purchase.quantity};
  }).toList();
  return firebasePurchases as List<Map<String, dynamic>>;
}

List<Orderr> jsonOrdersToOrders(List<Map<String, dynamic>> jsonOrders) {
  List orders =
      jsonOrders.map((jsonPurchase) => Orderr.fromJson(jsonPurchase)).toList();
  return orders as List<Orderr>;
}

List<Map<String, dynamic>> ordersToJsonOrders(List<Orderr> orders) {
  List jsonOrders = orders.map((order) => order.toJson()).toList();
  return jsonOrders as List<Map<String, dynamic>>;
}

String dateToString(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
}

DateTime? stringToDate(String dateString) {
  try {
    // Ensure the input string matches the expected format
    final regex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.(\d{4})$');
    if (!regex.hasMatch(dateString)) {
      throw FormatException('Invalid date format');
    }

    // Extract day, month, and year
    final day = int.parse(dateString.substring(0, 2));
    final month = int.parse(dateString.substring(3, 5));
    final year = int.parse(dateString.substring(6, 10));

    // Return a DateTime object
    return DateTime(year, month, day);
  } catch (e) {
    // Return null for invalid input
    return null;
  }
}
