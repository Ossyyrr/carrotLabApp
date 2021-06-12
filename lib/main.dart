import 'package:carrotslabapp/src/my_app.dart';
import 'package:carrotslabapp/src/providers/animation_provider.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO quitar comentarios innecesarios
// TODO cartel de información para dejar presionado sobre el mapa
// TODO translate app
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

//key api google maps:
//AIzaSyD7HJmBxikmy-K7VOMFkNLiObJplw0Muco
