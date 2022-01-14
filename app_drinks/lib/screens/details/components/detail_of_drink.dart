import 'package:app_drinks/components/snack_bar.dart';
import 'package:app_drinks/database/dao/drink_dao.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DetailOfDrink extends StatelessWidget {
  final DrinkDetails drinkDetails;
  final Size size;

  DetailOfDrink(this.drinkDetails, this.size, {Key? key}) : super(key: key);

  final DrinkDao _dao = DrinkDao();

  @override
  Widget build(BuildContext context) {
    final drink = drinkDetails.drinks[0];
    return SizedBox(
      height: size.height + 12,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Image.network(
                drink['strDrinkThumb']!,
                height: size.height * 0.4,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(drink['strDrink']!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600)),
                      Text(drink['strAlcoholic']!,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _save(context);
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor!.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Text(
                      'Ingredients:',
                      style: textTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 8.0, right: 8.0),
                    child: Text(
                      (drink['strIngredient1'] ?? "") +
                          " " +
                          (drink['strMeasure1'] ?? "") +
                          " " +
                          (drink['strIngredient2'] ?? "") +
                          " " +
                          (drink['strMeasure2'] ?? "") +
                          " " +
                          (drink['strIngredient3'] ?? "") +
                          " " +
                          (drink['strMeasure3'] ?? "") +
                          " " +
                          (drink['strIngredient4'] ?? "") +
                          " " +
                          (drink['strMeasure4'] ?? '') +
                          " " +
                          (drink['strIngredient5'] ?? '') +
                          " " +
                          (drink['strMeasure5'] ?? "") +
                          " " +
                          (drink['strIngredient6'] ?? '') +
                          " " +
                          (drink['strMeasure6'] ?? "") +
                          " " +
                          (drink['strIngredient7'] ?? '') +
                          " " +
                          (drink['strMeasure7'] ?? "") +
                          " " +
                          (drink['strIngredient8'] ?? '') +
                          " " +
                          (drink['strMeasure8'] ?? ""),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor!.withOpacity(0.23),
                    ),
                  ]),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Text(
                      'Instructions:',
                      style: textTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 8.0, right: 8.0),
                    child: Text(
                      drink['strInstructions']!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    try {
      await _dao.saveDrink(drinkDetails);
      await snackBarClickResponse(
          context, 'Your drink has been saved');
    } on DataBaseException catch (e) {
      snackBarClickResponse(context, e.message!);
    }
  }
}
