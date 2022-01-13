import 'package:app_drinks/models/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class TitleWithSearchBar extends StatelessWidget {
  const TitleWithSearchBar(
    this.size,
    this.title, {
    Key? key,
  }) : super(key: key);
  final Size size;
  final String title;


  @override
  Widget build(BuildContext context) {

    final myController = TextEditingController();

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.15,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: size.height * 0.12,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: size.width - 40,
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
                    onChanged: (value) =>
                        Provider.of<Search>(context, listen: false)
                            .newWord(value),
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
        ),
      ],
    );
  }
}
