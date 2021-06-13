import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CloudFirestoreProvider extends ChangeNotifier {
  CollectionReference location =
      FirebaseFirestore.instance.collection('locations');

  List<Marker> listMarker = [];

  CloudFirestoreProvider(BuildContext context) {
    _retrieveMarker;
    //init
  }

  Future<void> addLocation(String name, double longitude, double latitude) {
    // Call the user's CollectionReference to add a new user
    return location
        .add({
          'name': name,
          'latitude': latitude,
          'longitude': longitude,
        })
        .then((value) => debugPrint("Location Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<void> deleteLocation(String id) async {
    location.doc(id).delete();
  }

  void get _retrieveMarker {
    location.snapshots().listen((data) => data.docs.forEach((doc) {
          listMarker.add(Marker(
              markerId: MarkerId(doc.id.toString()),
              infoWindow: InfoWindow(title: doc['name']),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueCyan,
              ),
              position: LatLng(doc['latitude'], doc['longitude'])));
        }));
    notifyListeners();
  }
}
