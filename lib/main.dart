import 'package:carrotslabapp/src/constants/theme_data.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:carrotslabapp/src/screens/HomeScreen/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './generated/l10n.dart';
import 'package:provider/provider.dart';

// TODO quitar comentarios innecesarios
// TODO cartel de información para dejar presionado sobre el mapa
// TODO translate app
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CoordinatesProvider(context),
    ),
  ], child: MyApp()));
}

//key api google maps:
//AIzaSyD7HJmBxikmy-K7VOMFkNLiObJplw0Muco

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDataApp(),
      home: Homescreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalization.delegate,
      ],
      supportedLocales: AppLocalization.delegate.supportedLocales,
    );
  }
}
