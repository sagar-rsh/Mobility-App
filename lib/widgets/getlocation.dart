import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

Future getLocation() async {
//    Location location = new Location();
  LocationData position = await Location().getLocation();
//    print(position);
  final coordinates = new Coordinates(position.latitude, position.longitude);
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
//    print(
//        ' 111${first.locality}, 222${first.adminArea},333${first.subLocality}, 444${first.subAdminArea},555${first.addressLine}, 666${first.featureName},777${first.thoroughfare}, 888${first.subThoroughfare}');
//    print("${first.subLocality}");
//    print(addresses);
  return first.thoroughfare;
}
