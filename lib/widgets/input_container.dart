// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  InputContainer({required this.hint, required this.roomNameController, required this.keyboardType});

  String hint;
  TextEditingController roomNameController;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFD9D9D9),
        ),
        child: TextField(
          controller: roomNameController,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hint.toString(),
          ),
        ));
  }
}
