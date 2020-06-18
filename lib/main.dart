import 'package:flutter/material.dart';
import 'package:mobility_services_app/models/user.dart';
import 'package:mobility_services_app/screens/authenticate/loginThree.dart';
import 'package:mobility_services_app/screens/wrapper.dart';
import 'package:mobility_services_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: Wrapper(),
      ),
    );
  }
}
