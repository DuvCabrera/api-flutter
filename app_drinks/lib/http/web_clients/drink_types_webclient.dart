import 'package:app_drinks/models/list_drink.dart';
import 'package:http/http.dart';

import '../web_client.dart';
class DrinkTypesWebClient{
  Future<ListDrink> getDrinksList(String str) async {
    final Response response = await client.get(Uri.parse(drinkTypeUrl + str));
    if (response.statusCode == 200){
      return ListDrink.fromJson(response.body);
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)){
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    404: 'Page Not Found'
  };
}

class HttpException implements Exception{
  final String? message;

  HttpException(this.message);
}

