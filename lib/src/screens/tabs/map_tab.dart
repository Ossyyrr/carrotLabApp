import 'dart:async';

import 'package:carrotslabapp/src/animations/tutorial_map_stagger_animation.dart';
import 'package:carrotslabapp/src/constants/button_style.dart';
import 'package:carrotslabapp/src/providers/animation_provider.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:carrotslabapp/src/widgets/drawer_locations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../generated/l10n.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key, required this.controller}) : super(key: key);
  final TabController? controller;
  @override
  State<MapTab> createState() => MapTabState();
}

class MapTabState extends State<MapTab> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

// TODO eliminar initState que no se usen

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final CameraPosition _initialcameraposition = CameraPosition(
    target: LatLng(41, -3.5),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: DrawerLocations(
        scaffoldKey: _scaffoldKey,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _initialcameraposition,
            onMapCreated: (GoogleMapController controller) {
              context.read<CoordinatesProvider>().onMapCreated(controller);
            },
            markers: {
              if (context.watch<CoordinatesProvider>().point != null)
                context.watch<CoordinatesProvider>().point!,
            },
            onLongPress: context.read<CoordinatesProvider>().addPoint,
            onCameraMove: (position) =>
                // TODO Guardar la posición actual del mapa y que no se pierda al cambiar de pantalla

                context.read<CoordinatesProvider>().clearPoint(),
          ),
          _saveButton,
          context.watch<AnimationProvider>().showTutorialMap
              ? TutorialStaggerAnimation(
                  controller:
                      context.read<AnimationProvider>().tutorialMapController)
              : SizedBox(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
          tooltip: AppLocalization.of(context).go_locations,
          child: new Icon(Icons.near_me),
          onPressed: () => {
                _scaffoldKey.currentState!.openDrawer(),
              }),
    );
  }

  Widget get _saveButton {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: context.watch<CoordinatesProvider>().point != null ? 1 : 0,
        child: ElevatedButton(
          onPressed: () => {
            widget.controller!.animateTo(1),
          },
          style: buttonStyle,
          child: Row(
            children: [
              SizedBox(width: 22),
              Text(AppLocalization.of(context).save.toUpperCase()),
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
