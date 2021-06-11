import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesProvider extends ChangeNotifier {
  Marker? point;
  String? name;
  double? longitude;
  double? latitude;

  CoordinatesProvider(BuildContext context) {
    //init
  }

  void addPoint(LatLng pos) {
    point = Marker(
        markerId: const MarkerId('point'),
        infoWindow:
            InfoWindow(title: 'lat: ${pos.latitude}, lon: ${pos.longitude}'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRose,
        ),
        position: pos);

    longitude = point!.position.longitude;
    latitude = point!.position.latitude;

    notifyListeners();
  }

  void clearPoint() {
    point = null;
    notifyListeners();
  }

  void setName(String text) {
    name = text;
    notifyListeners();
  }

  void setLongitude(String long) {
    longitude = double.parse(long);
    notifyListeners();
  }

  void setLatitude(String lat) {
    latitude = double.parse(lat);
    notifyListeners();
  }
}
