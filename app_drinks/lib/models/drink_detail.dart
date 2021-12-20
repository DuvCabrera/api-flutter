import 'dart:convert';

DrinkDetails drinkDetailsFromJson(String str) => DrinkDetails.fromJson(json.decode(str));

String drinkDetailsToJson(DrinkDetails data) => json.encode(data.toJson());

class DrinkDetails {
  DrinkDetails({
    required this.drinks,
  });

  List<Map<String, dynamic>> drinks;

  factory DrinkDetails.fromJson(Map<String, dynamic> json) => DrinkDetails(
    drinks: List<Map<String, dynamic>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  };
}
