class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? rating;
  int? stock;
  double? discountPercentage;
  List<dynamic>? tags;
  List<dynamic>? images;

  Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? rating,
    int? stock,
    double? discountPercentage,
    List<dynamic>? tags,
    List<dynamic>? images,
  }) {
    this.id = id ?? 0;
    this.title = title ?? '';
    this.description = description ?? '';
    this.category = category ?? '';
    this.price = price ?? 0;
    this.rating = rating ?? 0;
    this.images = images ?? ['images'];
    this.discountPercentage = discountPercentage ?? 0;
    this.tags = tags ?? ['tags'];
    this.stock = stock;
  }

  Product.fromJson(json) {
    this.id = json['id'] is int
        ? json['id']
        : (json['id'] is double)
        ? (json['id'] as double).toInt()
        : json['id'];
    this.stock = json['stock'] is int
        ? json['stock']
        : (json['stock'] is double)
        ? (json['stock'] as double).toInt()
        : json['stock'];
    this.title = json['title'];
    this.description = json['description'];
    this.category = json['category'];
    this.price = json['price'] is int
        ? (json['price'] as int).toDouble()
        : json['price'];
    this.rating = json['rating'] is int
        ? (json['rating'] as int).toDouble()
        : json['rating'];
    this.images = json['images'];
    this.discountPercentage = json['discountPercentage'] is int
        ? (json['discountPercentage'] as int).toDouble()
        : json['discountPercentage'];
    this.tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stock': stock,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'rating': rating,
      'images': images,
      'discountPercentage': discountPercentage,
      'tags': tags,
    };
  }

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? rating,
    String? brand,
    int? stock,
    String? availabilityStatus,
    double? discountPercentage,
    List<String>? tags,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      tags: tags ?? this.tags,
      images: images ?? this.images,
    );
  }
}
