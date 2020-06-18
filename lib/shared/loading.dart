import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC7C9CB),
      child: Center(
        child: SpinKitSquareCircle(
          color: Theme.of(context).primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
