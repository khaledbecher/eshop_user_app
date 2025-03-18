import 'package:eshop/models/product.dart';

class Purchase {
  int? quantity;
  Product? product;

  Purchase({this.quantity, this.product});

  Purchase copyWith({int? quantity, Product? product}) {
    return Purchase(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Purchase.fromJson(json) {
    quantity = json['quantity'];
    product = Product.fromJson(json['product']);
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'product': product!.toJson(),
    };
  }
}
