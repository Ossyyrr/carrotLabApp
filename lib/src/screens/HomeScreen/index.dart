import 'package:carrotslabapp/src/screens/PlacesScreen/index.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.map),
        titleSpacing: 0,
        title: Text('Carrots Lab App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.of(context, rootNavigator: true)
                    .pushReplacement(PlacesScreen.route()),
                child: Text(AppLocalization.of(context).welcome))
          ],
        ),
      ),
    );
  }
}
