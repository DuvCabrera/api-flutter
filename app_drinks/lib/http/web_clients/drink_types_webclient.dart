import 'package:app_drinks/models/list_drink.dart';
import 'package:http/http.dart';

import '../web_client.dart';
class DrinkTypesWebClient{
  Future<ListDrink> getDrinksList(String str) async {
    final Response response = await client.get(Uri.parse(drinkTypeUrl + str));
    return ListDrink.fromJson(response.body);
  }
}
