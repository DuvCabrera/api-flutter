import 'package:flutter/material.dart';

import 'components/body.dart';

class BookMarkDetails extends StatelessWidget {
  const BookMarkDetails({Key? key, required this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id),
    );
  }
}
