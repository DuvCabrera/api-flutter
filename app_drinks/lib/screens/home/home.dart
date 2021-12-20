
import 'package:flutter/material.dart';

import 'components/body.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
