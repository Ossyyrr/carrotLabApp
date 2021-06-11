import 'package:carrotslabapp/src/widgets/custom_text_form_field.dart';
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
  double? longitude;
  double? latitude;

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

  void setLongitude(String long) {
    setState(() {
      longitude = double.parse(long);
    });
  }

  void setLatitude(String lat) {
    setState(() {
      latitude = double.parse(lat);
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
