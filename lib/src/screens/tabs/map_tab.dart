import 'dart:async';

import 'package:carrotslabapp/src/widgets/drawer_locations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTab extends StatefulWidget {
  @override
  State<MapTab> createState() => MapTabState();
}

class MapTabState extends State<MapTab> {
// TODO dejar solo un controller
  Location _location = Location();
  Completer<GoogleMapController> _completerController = Completer();

  @override
  void initState() {
    _goCurrentPosition;
    super.initState();
  }

  Future<LocationData> get _currentLocation async {
    return await _location.getLocation();
  }

  static final CameraPosition _initialcameraposition = CameraPosition(
    target: LatLng(41, -3.5),
    zoom: 5,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _initialcameraposition,
        onMapCreated: (GoogleMapController controller) {
          _completerController.complete(controller);
          // _location.onLocationChanged.listen((l) {});
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goCurrentPosition() async {
    LocationData location = await _currentLocation;

    final GoogleMapController controller = await _completerController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(location.latitude!, location.longitude!), zoom: 15),
    ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _completerController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
