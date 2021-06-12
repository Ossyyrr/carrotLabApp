import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'package:provider/provider.dart';

class DrawerLocations extends StatelessWidget {
  const DrawerLocations({Key? key, required this.scaffoldKey})
      : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _locationsStream =
        context.read<CloudFirestoreProvider>().location.snapshots();

    return Stack(
      children: [
        Drawer(
          child: StreamBuilder<QuerySnapshot>(
            stream: _locationsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                //  return Text("Loading");
              }

              /*  return ListView(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: DrawerHeader(
                        decoration:
                            BoxDecoration(color: Theme.of(context).accentColor),
                        child: Center(
                          child: Text(
                            AppLocalization.of(context).location,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        margin: EdgeInsets.all(0.0),
                        padding: EdgeInsets.all(0.0)),
                  ),
                  _card,
                  _card,
                  _card,
                  _card,
                  _card,
                  _card,
                  _card,
                ],
              );*/

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return _card(context, data['name'], data['latitude'],
                      data['longitude']);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _card(
      BuildContext context, String name, double latitude, double longitude) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: ListTile(
          title: Text(name.toUpperCase()),
          subtitle: Text('Ir a ' + name),
          onTap: () {
            context.read<CoordinatesProvider>().goTo(latitude, longitude);
            scaffoldKey.currentState!.openEndDrawer();
          },
          trailing: Icon(Icons.delete_forever_outlined),
        ),
      ),
    );
  }
}
