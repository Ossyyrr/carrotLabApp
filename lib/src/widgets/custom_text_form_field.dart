import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.initialValue,
    required this.setState,
    required this.textInputType,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final String? initialValue;
  final Function setState;
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
          setState(value);
        },
        initialValue: initialValue,
        validator: (dynamic value) {
          if (value == null || value.isEmpty) {
            // TODO traducir
            return 'Please enter some text';
          }
          return null;
        },
        keyboardType: textInputType,
      ),
    );
  }
}
