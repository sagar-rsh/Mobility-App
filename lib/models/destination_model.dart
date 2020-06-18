import 'package:mobility_services_app/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'images/stmarksbasilica.jpg',
    name: 'Service #1',
    type: '89 Ratings',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 330,
  ),
  Activity(
    imageUrl: 'images/gondola.jpg',
    name: 'Service #2',
    type: '69 Ratings',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 310,
  ),
  Activity(
    imageUrl: 'images/murano.jpg',
    name: 'Service #3',
    type: '79 Ratings',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 325,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'images/venice.jpg',
    city: 'Tools',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'images/paris.jpg',
    city: 'Carpenter',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'images/newdelhi.jpg',
    city: 'Painter',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'images/saopaulo.jpg',
    city: 'Job',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
