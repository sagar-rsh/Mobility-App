import 'package:flutter/material.dart';
import 'package:mobility_services_app/screens/myOrders.dart';
import 'package:mobility_services_app/widgets/icon_card.dart';
import 'package:mobility_services_app/widgets/images_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:mobility_services_app/widgets/getlocation.dart';
import 'package:mobility_services_app/screens/profile.dart';
import 'package:mobility_services_app/screens/myOrders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _widgets = <Widget>[
    HomePage(),
    HomePage(),
    MyOrders(),
    Profile()
  ];

  PageController pageController = PageController();

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: _widgets,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
              size: 25,
            ),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.locationArrow,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      var result = await getLocation();
                      setState(() {
                        res = result;
                      });
                    },
                  ),
                  Text(
                    'You\'re at,$res',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Hello, ',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor)),
                          TextSpan(text: 'what are you\nlooking for?')
                        ],
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconCard(
                    item: 0,
                    iconData: FontAwesomeIcons.tools,
                    text: 'Tools',
                  ),
                  IconCard(
                    item: 1,
                    iconData: FontAwesomeIcons.hammer,
                    text: 'Carpenter',
                  ),
                  IconCard(
                    item: 2,
                    iconData: FontAwesomeIcons.paintRoller,
                    text: 'Painter',
                  ),
                  IconCard(
                    item: 3,
                    iconData: FontAwesomeIcons.lightbulb,
                    text: 'Electrician',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Best Experiences',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: Container(child: ImageCards())),
              SizedBox(
                height: 25,
              ),
//              Align(
//                alignment: Alignment.bottomCenter,
//                child: Container(
//                  color: Theme.of(context).accentColor,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      IconButton(
//                          icon: Icon(
//                            Icons.home,
//                            color: Theme.of(context).primaryColor,
//                            size: 30,
//                          ),
//                          onPressed: () {}),
//                      IconButton(
//                          icon: Icon(
//                            Icons.search,
//                            color: Colors.black,
//                            size: 30,
//                          ),
//                          onPressed: () {}),
//                      IconButton(
//                          icon: Icon(
//                            Icons.add_shopping_cart,
//                            color: Colors.black,
//                            size: 25,
//                          ),
//                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => OrderHistory()),
//                            );
//                          }),
//                      IconButton(
//                          icon: Icon(
//                            Icons.person_outline,
//                            color: Colors.black,
//                            size: 30,
//                          ),
//                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => Profile()),
//                            );
//                          }),
//                    ],
//                  ),
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
