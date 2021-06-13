import 'dart:async';

import 'package:carrotslabapp/src/blocs/weather_block.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CoordinatesProvider extends ChangeNotifier {
  Marker? point;
  String? name;
  double? longitude;
  double? latitude;

  Location _location = Location();
  Completer<GoogleMapController> _completerController = Completer();

  WeatherBloc weatherBloc = WeatherBloc();

  CoordinatesProvider(BuildContext context) {
    //init
    goCurrentPosition;
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

    weatherBloc.fetchWeather(latitude.toString(), longitude.toString());
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

  Future<void> get goCurrentPosition async {
    LocationData location = await _location.getLocation();
    final GoogleMapController controller = await _completerController.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(location.latitude!, location.longitude!), zoom: 15),
    ));

    weatherBloc.fetchWeather(
        location.latitude.toString(), location.longitude.toString());
  }

  void onMapCreated(GoogleMapController controller) {
    goCurrentPosition;
    _completerController.complete(controller);
    //  _location.onLocationChanged.listen((l) {});
  }

  Future<void> goTo(double latitude, double longitude) async {
    final CameraPosition _go = CameraPosition(
        bearing: 180, target: LatLng(latitude, longitude), tilt: 55, zoom: 15);

    // TODO sacar este controller fuera de la funciÃ³n
    final GoogleMapController controller = await _completerController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_go));
  }
}
