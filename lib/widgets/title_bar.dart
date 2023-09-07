// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  TitleBar({
    super.key,
    required this.title,
  });

  String title;

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color(0xFFD9D9D9),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      leadingWidth: 30,
    );
  }
}