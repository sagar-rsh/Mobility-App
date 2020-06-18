import "package:flutter/material.dart";
import 'package:mobility_services_app/screens/authenticate/loginThree.dart';
import 'package:mobility_services_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  //Authenticate({this.showSignIn});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    showSignIn = !showSignIn;
  }

  @override
  Widget build(BuildContext context) {
    //print(showSignIn);
    if (showSignIn) {
      return LoginThree(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
