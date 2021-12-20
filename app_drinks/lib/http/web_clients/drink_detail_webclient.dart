import 'package:app_drinks/models/drink_detail.dart';
import 'package:http/http.dart';

import '../web_client.dart';

class DrinkDetailWebClient {
  Future<DrinkDetails> getDrinkDetail(String drinkId) async {
    final Response response =
        await client.get(Uri.parse(searchByIdUrl + drinkId));
    DrinkDetails drinkDetail = drinkDetailsFromJson(response.body);
    return drinkDetail;
  }
}
