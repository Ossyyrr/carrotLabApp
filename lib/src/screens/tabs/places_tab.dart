import 'package:flutter/material.dart';

class PlacesTab extends StatefulWidget {
  const PlacesTab({Key? key}) : super(key: key);

  static MaterialPageRoute route() => MaterialPageRoute(
        settings: const RouteSettings(name: '/places'),
        builder: (_) => PlacesTab(),
      );

  @override
  _PlacesTabState createState() => _PlacesTabState();
}

class _PlacesTabState extends State<PlacesTab> {
  String? name;
  int? longitude;
  int? latitude;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // TODO quitar decoración de scroll al scrollear
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Text(
                  'GUARDAR LUGARES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: 'Name *',
                      hintText: 'Nombre del lugar que vas a guardar',
                      setState: setName,
                      textInputType: TextInputType.name,
                    ),
                    CustomTextFormField(
                      labelText: 'Longitud *',
                      hintText: 'Coordenadas de longitud',
                      setState: setLongitude,
                      textInputType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      labelText: 'Latitud *',
                      hintText: 'Coordenadas de latitud',
                      setState: setLatitude,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: onSubmit,
                child: Text('GUARDAR'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setName(String text) {
    setState(() {
      name = text;
    });
  }

  void setLongitude(int long) {
    print('Cambio longitud');

    setState(() {
      longitude = long;
    });
  }

  void setLatitude(int lat) {
    print('Cambio latitud');

    setState(() {
      latitude = lat;
    });
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      print('SUBMIT -----------------');
      print(name);
      print(longitude);
      print(latitude);
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.setState,
    required this.textInputType,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final Function? setState;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
        ),
        onChanged: (dynamic value) {
          setState!(value);
        },
        validator: (dynamic value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        keyboardType: textInputType,
      ),
    );
  }
}
