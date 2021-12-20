import 'dart:convert';

class ListDrink {
  final List<Drink> drinks;

  ListDrink(this.drinks);

  factory ListDrink.fromJson(String str) => ListDrink.fromMap(json.decode(str));

  ListDrink.fromMap(Map<String, dynamic> json)
      : drinks = List<Drink>.from(json['drinks'].map((x) => Drink.fromMap(x)));
}

class Drink {
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  Drink(this.strDrink, this.strDrinkThumb, this.idDrink);

  Drink.fromMap(Map<String, dynamic> json)
      : strDrink = json['strDrink'],
        strDrinkThumb = json['strDrinkThumb'],
        idDrink = json['idDrink'];
}
