import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/components/grid_list.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchGridList extends StatefulWidget {
  final List<Drink> listDrink;
  final Size size;

  const SearchGridList(this.listDrink, this.size, {Key? key}) : super(key: key);

  @override
  _SearchGridListState createState() => _SearchGridListState();
}

class _SearchGridListState extends State<SearchGridList> {
  final myController = TextEditingController();

  late List<Drink> searchedDrinks = [];

  @override
  initState() {
    super.initState();
    searchedDrinks = widget.listDrink;
  }

  void _runFilter(String enteredKeyword) {
    List<Drink> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.listDrink;
    } else {
      results = widget.listDrink
          .where((user) =>
          user.strDrink.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchedDrinks = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: widget.size.height + 48,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor!.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: myController,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: kPrimaryColor!.withOpacity(0.5)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
          GridList(searchedDrinks, widget.size),
        ],
      ),
    );
  }
}
