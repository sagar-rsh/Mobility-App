import "package:flutter/material.dart";
import 'package:mobility_services_app/models/user.dart';
import 'package:mobility_services_app/screens/authenticate/authenticate.dart';
import 'package:mobility_services_app/screens/home/home.dart';
import 'package:mobility_services_app/screens/home/welcome.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either Home Or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
