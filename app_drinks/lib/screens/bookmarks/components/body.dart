import 'package:app_drinks/screens/bookmarks/components/title_with_searchbar_without_backarrow.dart';
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
        children: [TitleWithSearchBarWithoutBackArrow(size, 'BookMark'),
        FutureGridList(size),

        ],
      ),
    );
  }
}
