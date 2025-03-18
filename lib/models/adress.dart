class Adress {
  String? street;
  String? houseNumber;
  String? country;
  String? city;
  String? postalCode;
  String? title;

  Adress({
    this.title ='',
    this.street ='',
    this.houseNumber ='',
    this.country ='',
    this.city ='',
    this.postalCode ='',
  });

  Adress.fromJson(json) {
    title = json['title'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postalCode'];
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'street': street,
      'houseNumber': houseNumber,
      'country': country,
      'city': city,
      'postalCode': postalCode,
    };
  }
}
