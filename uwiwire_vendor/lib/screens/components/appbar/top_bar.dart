import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopBar {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      actions: const <Widget>[
        Center(child: Text('UWIwire')),
      ],
    );
  }
}
