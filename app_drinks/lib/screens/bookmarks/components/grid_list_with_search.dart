import 'package:app_drinks/models/favorite_drink.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'grid_list_favorite.dart';

class GridListWithSearch extends StatefulWidget {
  const GridListWithSearch( this._listDrink, this.size,{Key? key,}) : super(key: key);
  final Size size;
  final List<MarkedDrink> _listDrink;

  @override
  State<GridListWithSearch> createState() => _GridListWithSearchState();
}

class _GridListWithSearchState extends State<GridListWithSearch> {
  final myController = TextEditingController();

  late String word = "";

  _initWord(String value) {
    setState(() {
      word = value;
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
                    onChanged: (value) => _initWord(value),
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
          GridListFavorite(widget._listDrink, widget.size, word),
        ],
      ),
    );
  }
}
