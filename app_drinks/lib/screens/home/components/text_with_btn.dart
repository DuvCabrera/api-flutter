
import 'package:app_drinks/constants.dart';
import 'package:flutter/material.dart';


class TextWithBtn extends StatelessWidget {
  final String title;
  final Function onClick;

  const TextWithBtn(this.title, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderline(title),
          const Spacer(),
          ElevatedButton(onPressed: () => onClick(), child: const Text('More'))
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  final String text;

  const TitleWithCustomUnderline(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor!.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}


