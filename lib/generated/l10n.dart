// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Press and hold a place \n on the map to mark it`
  String get mark_map {
    return Intl.message(
      'Press and hold a place \n on the map to mark it',
      name: 'mark_map',
      desc: '',
      args: [],
    );
  }

  /// `Go to locations`
  String get go_locations {
    return Intl.message(
      'Go to locations',
      name: 'go_locations',
      desc: '',
      args: [],
    );
  }

  /// `Name *`
  String get name_label_text {
    return Intl.message(
      'Name *',
      name: 'name_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Name with which you will save this place`
  String get name_hint_text {
    return Intl.message(
      'Name with which you will save this place',
      name: 'name_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Longitude *`
  String get longitude_label_text {
    return Intl.message(
      'Longitude *',
      name: 'longitude_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Longitude coordinates`
  String get longitude_hint_text {
    return Intl.message(
      'Longitude coordinates',
      name: 'longitude_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Latitude *`
  String get latitude_label_text {
    return Intl.message(
      'Latitude *',
      name: 'latitude_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Latitude coordinates`
  String get latitude_hint_text {
    return Intl.message(
      'Latitude coordinates',
      name: 'latitude_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
