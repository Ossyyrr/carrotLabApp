// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error": MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "fill_field":
            MessageLookupByLibrary.simpleMessage("Please fill in the field"),
        "go_locations": MessageLookupByLibrary.simpleMessage("Go to locations"),
        "go_to": MessageLookupByLibrary.simpleMessage("Go to "),
        "latitude_hint_text":
            MessageLookupByLibrary.simpleMessage("Latitude coordinates"),
        "latitude_label_text":
            MessageLookupByLibrary.simpleMessage("Latitude *"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "longitude_hint_text":
            MessageLookupByLibrary.simpleMessage("Longitude coordinates"),
        "longitude_label_text":
            MessageLookupByLibrary.simpleMessage("Longitude *"),
        "map": MessageLookupByLibrary.simpleMessage("Map"),
        "mark_map": MessageLookupByLibrary.simpleMessage(
            "Press and hold a place \n on the map to mark it"),
        "name_hint_text": MessageLookupByLibrary.simpleMessage(
            "Name with which you will save this place"),
        "name_label_text": MessageLookupByLibrary.simpleMessage("Name *"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "save_places": MessageLookupByLibrary.simpleMessage("Save places"),
        "weather": MessageLookupByLibrary.simpleMessage("Weather")
      };
}
