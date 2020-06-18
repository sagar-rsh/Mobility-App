import 'package:flutter/material.dart';
import 'package:mobility_services_app/screens/authenticate/authenticate.dart';
import 'package:mobility_services_app/screens/authenticate/register.dart';
import 'package:mobility_services_app/services/auth.dart';
import 'package:mobility_services_app/services/styles.dart';
import 'package:mobility_services_app/shared/loading.dart';
import 'package:mobility_services_app/widgets/custom_text.dart';
import 'package:mobility_services_app/widgets/logo.dart';
import 'package:mobility_services_app/widgets/placeholder_txt.dart';
import 'package:mobility_services_app/widgets/rectTextInput.dart';
import 'package:mobility_services_app/widgets/round_btn.dart';
import 'package:mobility_services_app/widgets/round_btn_gradient.dart';

class LoginThree extends StatefulWidget {
  final Function toggleView;
  LoginThree({this.toggleView()});

  @override
  _LoginThreeState createState() => _LoginThreeState();
}

class _LoginThreeState extends State<LoginThree> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Container(
//                height: MediaQuery.of(context),
                decoration: BoxDecoration(border: Border.all(color: grey)),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Logo(),
                        Text(
                          "Mobility Services",
                          style: TextStyle(
                              letterSpacing: 4,
                              fontSize: 25,
                              color: black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? "Enter Email Address" : null,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: "Email Address",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none),
                              onChanged: (val) {
                                email = val;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              validator: (val) => val.length < 6
                                  ? "Enter password 6+ Char Long"
                                  : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none),
                              onChanged: (val) {
                                pass = val;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
//                child: RoundBtnGradient(
////                  msg: "Login",
////                  function: () async {
////                    print(email);
////                    print(pass);
////                  },
////                  colorOne: Colors.pink[300],
////                  colorTwo: Colors.orange[300],
////                ),
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(email, pass);
                                if (result == null) {
                                  setState(() {
                                    error = "Invalid Email or Password";
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF085782),
                                        Color(0xFF93BDE3),
                                      ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: CustomText(
                                      msg: "Login",
                                      color: white,
                                      size: 24,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
//                child: RoundBtnGradient(
//                  msg: "Register",
//                  function: () {
//                    widget.toggleView();
//                  },
//                  colorOne: Colors.pink[300],
//                  colorTwo: Colors.orange[300],
//                ),
                          child: FlatButton(
                            onPressed: () {
//                              widget.toggleView();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF085782),
                                        Color(0xFF93BDE3),
                                      ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: CustomText(
                                      msg: "Register",
                                      color: white,
                                      size: 24,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundBtnGradient(
                                  msg: "facebook",
                                  function: () {},
                                  colorOne: Colors.blueAccent,
                                  colorTwo: Colors.blue[300],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: RoundBtnGradient(
                                  msg: "Guest user",
                                  function: () {},
                                  colorOne: Colors.green,
                                  colorTwo: Colors.green[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "by signing up you agree with our "),
                                TextSpan(
                                    text: "Terms and conditions",
                                    style: TextStyle(color: red))
                              ], style: TextStyle(color: black)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
