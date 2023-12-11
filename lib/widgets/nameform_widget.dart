import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  const NameForm({
    super.key,
    required this.formProperty,
    required this.formValues,
  });

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }

        if (value.length < 3) {
          return 'Please enter a name with at least 3 characters';
        }

        if (value.length > 15) {
          return 'Please enter a name with less than 15 characters';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.person, color: Colors.black),
        hintText: 'Enter a name',
        counterText: '3 characters minimum',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
      ),
      onChanged: (value) {
        formValues[formProperty] = value;
        // onChanged(value);
      },
    );
  }
}
