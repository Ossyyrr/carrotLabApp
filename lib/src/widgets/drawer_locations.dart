import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class DrawerLocations extends StatelessWidget {
  const DrawerLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          child: ListView(
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
          ),
        ),
      ],
    );
  }

  Widget get _card {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Titulo'),
          subtitle: Text(
              'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
          leading: Icon(Icons.home),
        ),
      ),
    );
  }
}
