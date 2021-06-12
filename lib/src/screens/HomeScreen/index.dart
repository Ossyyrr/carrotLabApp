import 'package:carrotslabapp/src/providers/animation_provider.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/screens/tabs/map_tab.dart';
import 'package:carrotslabapp/src/screens/tabs/places_tab.dart';
import 'package:carrotslabapp/src/widgets/home_botton_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? controller;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // Tab controller
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    context.read<AnimationProvider>().tutorialMapController =
        AnimationController(
      duration: const Duration(milliseconds: 3000),
      upperBound: 0.95,
      vsync: this,
    );

    context.read<CloudFirestoreProvider>().readData();

    super.initState();
  }

  void _onItemPressed(int index) {
    setState(() {
      _selectedIndex = index;
      controller!.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              controller!.animateTo(0);

              // TODO la siguiente línea es de prueba. Buscarle un lugar adecuado
              context.read<AnimationProvider>().startTuturialMapAnimation();
            },
            child: Icon(Icons.map, color: Colors.white)),
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
                      MapTab(controller: controller),
                      PlacesTab(),
                    ],
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                  ),
                  bottomNavigationBar: HomeBottomNavigationBar(
                    onItemPressed: _onItemPressed,
                    selectedIndex: _selectedIndex,
                  )),
            };
            final builder = routes[settings.name!];
            return MaterialPageRoute(
                settings: settings,
                builder: (BuildContext ctx) => builder!(ctx));
          }),
    );
  }
}
