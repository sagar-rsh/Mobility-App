import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/Logo.png',
          width: 140,
          height: 140,
        ),
      ],
    );
  }
}
