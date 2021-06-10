import 'package:carrotslabapp/src/screens/tabs/places.dart';
import 'package:carrotslabapp/src/screens/tabs/map.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? controller;

  @override
  void initState() {
    // Tab controller
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller!.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.map, color: Colors.white),
        titleSpacing: 0,
        title: Text('Carrots Lab Map'),
      ),
      body: Navigator(
          onPopPage: (route, result) => true,
          onGenerateRoute: (RouteSettings settings) {
            final routes = <String, WidgetBuilder>{
              '/': (BuildContext context) => Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: TabBarView(
                      children: <Widget>[
                        Map(),
                        Places(),
                      ],
                      controller: controller,
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.map),
                          label: AppLocalization.of(context).map,
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.location_on_outlined),
                          label: AppLocalization.of(context).location,
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: Colors.grey[700],
                      unselectedItemColor: Colors.white,
                      onTap: _onItemTapped,
                    ),
                  ),
            };
            final builder = routes[settings.name!];
            return MaterialPageRoute(
                settings: settings,
                builder: (BuildContext ctx) => builder!(ctx));
          }),
    );
  }
}
