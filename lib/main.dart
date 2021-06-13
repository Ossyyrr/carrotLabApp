import 'package:carrotslabapp/src/my_app.dart';
import 'package:carrotslabapp/src/providers/animation_provider.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CloudFirestoreProvider(context),
    ),
    ChangeNotifierProvider(
      create: (context) => CoordinatesProvider(context),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimationProvider(context),
      lazy: false,
    ),
  ], child: MyApp()));
}
