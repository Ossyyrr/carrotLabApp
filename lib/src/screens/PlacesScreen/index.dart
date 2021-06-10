import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  static MaterialPageRoute route() => MaterialPageRoute(
        settings: const RouteSettings(name: '/places'),
        builder: (_) => PlacesScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                Text('Places'),
              ],
            ),
            Container(
              child: Text('Places Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
