import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobility_services_app/models/service_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('UserData');

  final CollectionReference serviceCollection =
      Firestore.instance.collection('serviceProviders');

  Future<void> updateUserData(String name, String address) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'address': address,
    });
  }

  Future<void> updateServiceData(
      String name, String price, String service) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'price': price,
      'service': service,
    });
  }

  // carpenter list from snapshot
  List<Service> _serviceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Service(
        name: doc.data['name'] ?? '',
        price: doc.data['price'] ?? '0',
        service: doc.data['service'] ?? '',
      );
    }).toList();
  }

// get brews stream
  Stream<List<Service>> get services {
    return serviceCollection.snapshots().map(_serviceListFromSnapshot);
  }
}
