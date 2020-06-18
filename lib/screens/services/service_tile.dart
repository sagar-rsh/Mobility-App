import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:mobility_services_app/models/activity_model.dart';
//import 'package:mobility_services_app/screens/service_list.dart';
import 'package:mobility_services_app/models/service_model.dart';
import 'package:mobility_services_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobility_services_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mobility_services_app/services/auth.dart';

class ServiceTile extends StatelessWidget {
  final Service service;

  final n;
  static String serviceName;

  final int item;
  ServiceTile({this.service, this.n, this.item});

  bool _upper() {
    if (item == 0) {
//      tools = false;
      serviceName = 'tools';
      return true;
    } else if (item == 1) {
//      carpenter = false;
      serviceName = 'carpenter';
      return true;
    } else if (item == 2) {
//      painter = false;
      serviceName = 'painter';
      return true;
    } else if (item == 3) {
//      electrician = false;
      serviceName = 'electrician';
      return true;
    }
    return false;
  }

  bool _valid() {
    if (item == 0 && service.service == 'tools') {
//      tools = true;
      return true;
    } else if (item == 1 && service.service == 'carpenter') {
//      carpenter = true;
      return true;
    } else if (item == 2 && service.service == 'painter') {
//      painter = true;
      return true;
    } else if (item == 3 && service.service == 'electrician') {
//      electrician = true;
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
//    print(item);
    return Column(
      children: <Widget>[
        (n == 0 && _upper())
            ? Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: 'images/$serviceName.jpg',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          image: AssetImage('images/$serviceName.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.search),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                            IconButton(
                              icon: Icon(FontAwesomeIcons.sortAmountDown),
                              iconSize: 25.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    bottom: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          StringUtils.capitalize(serviceName),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 15.0,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'France',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 20.0,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 25.0,
                    ),
                  ),
                ],
              )
            : Container(),
        _valid()
            ? Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    height: 170.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                child: Text(
//                                    'Service #',
                                  service.name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '₹${service.price}',
//                                      '\₹350',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
//                            activity.type,
//                              '699 Ratings',
                            'Ratings: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
//                            _buildRatingStars(activity.rating),
                          Text('Stars'),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
//                                    activity.startTimes[0],
                                  '9:00 am',
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
//                                    activity.startTimes[1],
                                  '18:00 am',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 100.0,
//                          height: 100,
                        image: AssetImage(
//                            activity.imageUrl,
                          'images/service.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
