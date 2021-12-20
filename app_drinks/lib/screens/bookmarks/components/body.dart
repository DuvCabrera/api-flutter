import 'package:app_drinks/components/title_bar_without_back_button.dart';
import 'package:flutter/material.dart';

import 'future_grid_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitleBar(size, 'BookMark'),
          FutureGridList(size),
        ],
      ),
    );
  }
}
