import 'package:carrotslabapp/generated/l10n.dart';
import 'package:carrotslabapp/src/constants/button_style.dart';
import 'package:carrotslabapp/src/providers/cloud_firestore_provider.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:carrotslabapp/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class PlacesTab extends StatefulWidget {
  const PlacesTab({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  _PlacesTabState createState() => _PlacesTabState();
}

class _PlacesTabState extends State<PlacesTab> {
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
                  AppLocalization.of(context).save_places,
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

  Future<void> onSubmit() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      final name = context.read<CoordinatesProvider>().name!;
      final longitude = context.read<CoordinatesProvider>().longitude!;
      final latitude = context.read<CoordinatesProvider>().latitude!;

      context
          .read<CloudFirestoreProvider>()
          .addLocation(name, longitude, latitude);

      widget.tabController.animateTo(0);
    }
  }
}
