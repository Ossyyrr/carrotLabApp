import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

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
          elevation: 4,
          child: StreamBuilder<QuerySnapshot>(
            stream: _locationsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text(AppLocalization.of(context).error);
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final headerDrawer = Container(
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
              );

              final List<Widget> cards =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return _card(context, data, document.id);
              }).toList();

              return ListView(
                children: [headerDrawer, ...cards],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _card(BuildContext context, Map<String, dynamic> data, String id) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Card(
        child: ListTile(
          title: Text(data['name'].toUpperCase()),
          subtitle: Text(AppLocalization.of(context).go_to + data['name']),
          onTap: () {
            context
                .read<CoordinatesProvider>()
                .goTo(data['latitude'], data['longitude']);
            scaffoldKey.currentState!.openEndDrawer();
          },
          trailing: GestureDetector(
              onTap: () =>
                  context.read<CloudFirestoreProvider>().deleteLocation(id),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.delete_forever_outlined),
                  ))),
        ),
      ),
    );
  }
}
