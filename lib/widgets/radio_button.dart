// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  RadioButton({required this.value, required this.groupValue, required this.onChanged});

  String value;
  String groupValue;
  Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value);
          },
        ),
        Text(value),
      ],
    );
  }
}
