import 'package:carrotslabapp/src/screens/HomeScreen/index.dart';
import 'package:flutter/material.dart';
import 'package:carrotslabapp/src/constants/theme_data.dart';
import '../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Directionality(
              textDirection: TextDirection.ltr,
              child: Text('No se ha inicializado firebase'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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

        return Directionality(
            textDirection: TextDirection.ltr, child: Text('Cargando'));
      },
    );
  }
}
