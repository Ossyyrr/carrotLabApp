import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);

  static MaterialPageRoute route() => MaterialPageRoute(
        settings: const RouteSettings(name: '/places'),
        builder: (_) => Places(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back,
                        size: 20, color: Theme.of(context).primaryColorDark),
                    SizedBox(width: 20),
                    Text(
                      'Places',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
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
