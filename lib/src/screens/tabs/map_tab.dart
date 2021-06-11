import 'dart:async';

import 'package:carrotslabapp/src/constants/button_style.dart';
import 'package:carrotslabapp/src/widgets/drawer_locations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../generated/l10n.dart';

class MapTab extends StatefulWidget {
  @override
  State<MapTab> createState() => MapTabState();
}

class MapTabState extends State<MapTab> {
  Location _location = Location();
  Completer<GoogleMapController> _completerController = Completer();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Marker? _point;

// TODO eliminar initState que no se usen
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
      key: _scaffoldKey,
      drawer: DrawerLocations(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _initialcameraposition,
            onMapCreated: (GoogleMapController controller) {
              _goCurrentPosition;

              _completerController.complete(controller);
              _location.onLocationChanged.listen((l) {
                setState(() {
                  _point = null;
                });
              });
            },
            markers: {
              if (_point != null) _point!,
            },
            onLongPress: _addPoint,
          ),
          _saveButton,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: new Icon(Icons.near_me),
          onPressed: () => _scaffoldKey.currentState!.openDrawer()),
    );
  }

  void _addPoint(LatLng pos) {
    setState(() {
      _point = Marker(
          markerId: const MarkerId('point'),
          infoWindow:
              InfoWindow(title: 'lat: ${pos.latitude}, lon: ${pos.longitude}'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRose,
          ),
          position: pos);
    });
  }

  Future<void> get _goCurrentPosition async {
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

  Widget get _saveButton {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _point != null ? 1 : 0,
        child: ElevatedButton(
          onPressed: () => {print('guardar position')},
          style: buttonStyle,
          child: Row(
            children: [
              SizedBox(width: 22),
              Text('SAVE'),
              Icon(
                Icons.arrow_right_rounded,
                size: 44,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
