// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error": MessageLookupByLibrary.simpleMessage("Ocurrió un error"),
        "fill_field":
            MessageLookupByLibrary.simpleMessage("Porfavor, rellene el campo"),
        "go_locations":
            MessageLookupByLibrary.simpleMessage("Ir a localizaciones"),
        "go_to": MessageLookupByLibrary.simpleMessage("Ir a"),
        "latitude_hint_text":
            MessageLookupByLibrary.simpleMessage("Coordenadas de latitud"),
        "latitude_label_text":
            MessageLookupByLibrary.simpleMessage("Latitud *"),
        "location": MessageLookupByLibrary.simpleMessage("Localización"),
        "longitude_hint_text":
            MessageLookupByLibrary.simpleMessage("Coordenadas de longitud"),
        "longitude_label_text":
            MessageLookupByLibrary.simpleMessage("Longitud *"),
        "map": MessageLookupByLibrary.simpleMessage("Mapa"),
        "mark_map": MessageLookupByLibrary.simpleMessage(
            "Mantén presionado un lugar \n del mapa para marcarlo"),
        "name_hint_text": MessageLookupByLibrary.simpleMessage(
            "Nombre con el que guardarás este lugar"),
        "name_label_text": MessageLookupByLibrary.simpleMessage("Nombre *"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "save_places":
            MessageLookupByLibrary.simpleMessage("Guardar localizaciones"),
        "weather": MessageLookupByLibrary.simpleMessage("El tiempo")
      };
}
