import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesProvider extends ChangeNotifier {
  int? giftInviteFriend;
  Marker? point;

  CoordinatesProvider(BuildContext context) {
    //init
  }

  void addPoint(LatLng pos) {
    print('ADD POINT ----------------');

    point = Marker(
        markerId: const MarkerId('point'),
        infoWindow:
            InfoWindow(title: 'lat: ${pos.latitude}, lon: ${pos.longitude}'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRose,
        ),
        position: pos);
    notifyListeners();

    print(point);
  }

  void clearPoint() {
    point = null;
    notifyListeners();
  }
}
