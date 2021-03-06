import 'package:carrotslabapp/src/providers/animation_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:carrotslabapp/src/screens/tabs/map_tab.dart';
import 'package:carrotslabapp/src/screens/tabs/places_tab.dart';
import 'package:carrotslabapp/src/widgets/home_botton_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    // Tab controller
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    context.read<AnimationProvider>().tutorialMapController =
        AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    super.initState();
  }

  void _onItemPressed(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController!.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _tabController!.animateTo(0);
              context.read<CoordinatesProvider>().goCurrentPosition;
            },
            child: Icon(Icons.my_location_rounded, color: Colors.white)),
        actions: [
          GestureDetector(
              onTap: () {
                _tabController!.animateTo(0);
                context.read<AnimationProvider>().startTuturialMapAnimation();
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(Icons.info_outline_rounded, color: Colors.white),
              )),
        ],
        titleSpacing: 0,
        title: Text('Carrots Lab Map'),
      ),
      body: Navigator(
          onPopPage: (route, result) => true,
          onGenerateRoute: (RouteSettings settings) {
            final routes = <String, WidgetBuilder>{
              '/': (BuildContext context) => Scaffold(
                  body: TabBarView(
                    children: <Widget>[
                      MapTab(controller: _tabController),
                      PlacesTab(tabController: _tabController!),
                    ],
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
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
