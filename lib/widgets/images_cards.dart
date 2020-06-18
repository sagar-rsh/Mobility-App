import 'package:flutter/material.dart';
import 'package:mobility_services_app/models/places.dart';

import 'package:mobility_services_app/widgets/image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Place> places = [
    Place(place: 'Tools', image: 'tools.jpg', days: 7),
    Place(place: 'Paint', image: 'painter.jpg', days: 12),
    Place(place: 'Mechanic', image: 'mechanic.jpg', days: 3),
    Place(place: 'Carpeter', image: 'carpenter.jpg', days: 7),
    Place(place: 'Electrician', image: 'electrician.jpg', days: 12),
    Place(place: 'Tools', image: 'tools.jpg', days: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            itemBuilder: (_, index) {
              return ImageCard(
                place: places[index],
                name: places[index].place,
                days: places[index].days,
                picture: places[index].image,
              );
            }));
  }
}
