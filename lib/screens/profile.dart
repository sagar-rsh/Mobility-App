import 'package:flutter/material.dart';
import 'package:mobility_services_app/screens/authenticate/authenticate.dart';
import 'package:mobility_services_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
//  dynamic user = await _auth.signInWithEmailAndPassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: GetClipper(),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                Text(
                  'Your Name',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'yourname@email.com',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () async {
                          await _auth.signOut();
                          print("FU");
                          Navigator.pop(context);
//                          Authenticate();
//                          Navigator.pushAndRemoveUntil(
//                              context,
//                              PageRouteBuilder(pageBuilder:
//                                  (BuildContext context, Animation animation,
//                                      Animation secondaryAnimation) {
//                                return Authenticate();
//                              }, transitionsBuilder: (BuildContext context,
//                                  Animation<double> animation,
//                                  Animation<double> secondaryAnimation,
//                                  Widget child) {
//                                return new SlideTransition(
//                                  position: new Tween<Offset>(
//                                    begin: const Offset(1.0, 0.0),
//                                    end: Offset.zero,
//                                  ).animate(animation),
//                                  child: child,
//                                );
//                              }),
//                              (Route route) => false);
                        },
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
