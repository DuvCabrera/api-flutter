import 'package:flutter/material.dart';

import '../constants.dart';

class TitleBar extends StatelessWidget {
  final Size size;
  final String title;

  const TitleBar(this.size, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: size.height * 0.12,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
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
    );
  }
}
