import 'package:flutter/material.dart';

ButtonStyle buttonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(4),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
);
