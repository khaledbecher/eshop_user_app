import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/models/adress.dart';
import 'package:eshop/models/purchase.dart';

class Orderr {
  List<Purchase>? purchases;
  String? id;
  String? userId;
  Adress? shippingAdress;
  String? status;
  String? paymentMethod;
  String? price;
  String? createdAt;
  String? clientPhone;

  Orderr({
    this.purchases,
    this.id = '',
    this.shippingAdress,
    this.status = '',
    this.paymentMethod = '',
    this.price = '',
    this.userId='',
    this.clientPhone = '',
    String? createdAt,
  }) : createdAt = createdAt ?? dateToString(DateTime.now());

  Orderr.fromJson(json) {
    purchases = jsonPurchasesToPurchases(json['purchases']);
    id = json['id'];
    userId = json['userId'];
    shippingAdress = Adress.fromJson(json['shippingAdress']);
    status = json['status'];
    paymentMethod = json['paymentMethod'];
    price = json['price'];
    createdAt = json['createdAt'];
    clientPhone = json['clientPhone'];
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'purchases': purchasesToJsonPurchases(purchases!),
      'id': id,
      'userId':userId,
      'shippingAdress': shippingAdress!.toJson(),
      'status': status,
      'paymentMethod': paymentMethod,
      'price': price,
      'createdAt': createdAt,
      'clientPhone': clientPhone,
    };
  }
  // create a map for firebase with only products IDs in purchases
  Map<String, dynamic> toFirebase() {
    return {
      'purchases': purchasesToFirebasePurchases(purchases!),
      'id': id,
      'userId':userId,
      'shippingAdress': shippingAdress!.toJson(),
      'status': status,
      'paymentMethod': paymentMethod,
      'price': price,
      'createdAt': createdAt,
      'clientPhone': clientPhone,
    };
  }
}
