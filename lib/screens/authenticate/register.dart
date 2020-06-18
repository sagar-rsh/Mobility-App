import 'package:flutter/material.dart';
import 'package:mobility_services_app/screens/authenticate/authenticate.dart';
import 'package:mobility_services_app/screens/authenticate/loginThree.dart';
import 'package:mobility_services_app/services/auth.dart';
import 'package:mobility_services_app/services/styles.dart';
import 'package:mobility_services_app/shared/loading.dart';
import 'package:mobility_services_app/widgets/custom_text.dart';
import 'package:mobility_services_app/widgets/logo.dart';
import 'package:mobility_services_app/widgets/rectTextInput.dart';
import 'package:mobility_services_app/widgets/round_btn_gradient.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView()});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            body: Container(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Logo(),
                      Text(
                        "Register Here",
                        style: TextStyle(
                            letterSpacing: 3,
                            fontSize: 40,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 70,
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
//                  child: RoundBtnGradient(
//                    msg: "Sign Up",
//                    function: () async {
//                      if (_formKey.currentState.validate()) {
//                        print(email);
//                        print(pass);
//                      }
//                    },
//                    colorOne: Colors.pink[300],
//                    colorTwo: Colors.orange[300],
//                  ),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth
                                  .registerWithEmailAndPassword(email, pass);
                              if (result == null) {
                                setState(() {
                                  error = "Please provide Valid Credentials";
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
                                    msg: "Sign Up",
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
//                  child: RoundBtnGradient(
//                    msg: "Sign In",
//                    function: () {
//                      widget.toggleView();
//                    },
//                    colorOne: Colors.pink[300],
//                    colorTwo: Colors.orange[300],
//                  ),
                        child: FlatButton(
                          onPressed: () {
//                            widget.toggleView();
                            Navigator.pop(context);
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
                                    msg: "Sign In",
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
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
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
          );
  }
}
