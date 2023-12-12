import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  final TextEditingController _controller;

  NameForm({
    super.key,
    required this.formProperty,
    required this.formValues,
  }) : _controller = TextEditingController(text: formValues[formProperty]);

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          formProperty == 'name' ? TextInputType.name : TextInputType.multiline,
      maxLines: formProperty == 'name' ? 1 : 5,
      controller: _controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a $formProperty';
        }
        int min = 3;
        int max = 15;
        formProperty == 'description' ? min = 10 : min = 3;
        formProperty == 'description' ? max = 500 : max = 15;

        if (value.length < 3) {
          return 'Please enter a $formProperty with at least $min characters';
        }

        if (value.length > 15) {
          return 'Please enter a $formProperty with less than $max characters';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        suffixIcon: formProperty == 'name'
            ? const Icon(Icons.person, color: Colors.black)
            : const Icon(Icons.description, color: Colors.black),
        hintText: 'Enter a $formProperty',
        counterText: '${formProperty == 'name' ? 3 : 10} characters minimum',
        border: const OutlineInputBorder(
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
