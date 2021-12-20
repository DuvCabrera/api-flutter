import 'package:app_drinks/constants.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor!.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.star)),
        ],
      ),
    );
  }
}
