import 'package:app_drinks/components/title_bar.dart';
import 'package:flutter/material.dart';

import 'favorite_future.dart';

class Body extends StatelessWidget {
  const Body( this.id, {Key? key,}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleBar(size, "Your Favorites"),
          FavoriteFuture(size, id),
        ],
      ),
    );
  }
}
