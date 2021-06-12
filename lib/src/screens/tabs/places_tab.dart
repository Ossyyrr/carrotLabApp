import 'package:carrotslabapp/generated/l10n.dart';
import 'package:carrotslabapp/src/constants/button_style.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:carrotslabapp/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Text(
                  // TODO traducir
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
                      labelText: AppLocalization.of(context).name_label_text,
                      hintText: AppLocalization.of(context).name_hint_text,
                      setState: context.read<CoordinatesProvider>().setName,
                      textInputType: TextInputType.name,
                    ),
                    CustomTextFormField(
                      labelText:
                          AppLocalization.of(context).latitude_label_text,
                      hintText: AppLocalization.of(context).latitude_hint_text,
                      initialValue: context
                          .read<CoordinatesProvider>()
                          .point
                          ?.position
                          .latitude
                          .toString(),
                      setState: context.read<CoordinatesProvider>().setLatitude,
                      textInputType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      labelText:
                          AppLocalization.of(context).longitude_label_text,
                      hintText: AppLocalization.of(context).longitude_hint_text,
                      initialValue: context
                          .read<CoordinatesProvider>()
                          .point
                          ?.position
                          .longitude
                          .toString(),
                      setState:
                          context.read<CoordinatesProvider>().setLongitude,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: onSubmit,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(AppLocalization.of(context).save.toUpperCase()),
                ),
                style: buttonStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  //TODO Poner estos parámetros en el provider  (si no se rellenan a mano dan null)

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final name = context.read<CoordinatesProvider>().name!;
      final longitude = context.read<CoordinatesProvider>().longitude!;
      final latitude = context.read<CoordinatesProvider>().latitude!;

      print('SUBMIT -----------------');
      print(context.read<CoordinatesProvider>().name);
      print(context.read<CoordinatesProvider>().longitude);
      print(context.read<CoordinatesProvider>().latitude);

      context
          .read<CloudFirestoreProvider>()
          .addLocation(name, longitude, latitude);
    }
  }
}
