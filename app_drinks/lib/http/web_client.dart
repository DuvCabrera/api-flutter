import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:app_drinks/http/interceptors/logging_interceptor.dart';


final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String drinkTypeUrl = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=';
const String searchByIdUrl = 'http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=';

const String alcoholic = 'Alcoholic';
const String nonAlcoholic = 'Non_Alcoholic';