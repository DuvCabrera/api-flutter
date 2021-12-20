import 'package:flutter/material.dart';

import '../constants.dart';

class DrinkCard extends StatelessWidget {
  final String image;
  final String name;
  final Function press;

  const DrinkCard(this.image, this.name, this.press, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: () => press(),
        child: Column(
          children: [
            Image.network(
              image,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
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
                      child: Text(
                        name,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
