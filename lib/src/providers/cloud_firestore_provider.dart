import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreProvider extends ChangeNotifier {
  CollectionReference location =
      FirebaseFirestore.instance.collection('locations');

  CloudFirestoreProvider(BuildContext context) {
    //init
  }

  Future<void> addLocation(String name, double longitude, double latitude) {
    // Call the user's CollectionReference to add a new user
    return location
        .add({
          'name': name,
          'info.address.location': GeoPoint(latitude, longitude),
          'latitude': latitude,
          'longitude': longitude,
        })
        .then((value) => debugPrint("Location Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<void> deleteLocation(String id) async {
    location.doc(id).delete();
  }
}
