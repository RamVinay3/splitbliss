// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  TitleBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  String title;
  List<Widget> actions;

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: appColors.primary,
      titleTextStyle: TextStyle(
        color: appColors.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: appColors.onPrimary,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      leadingWidth: 30,
      actions: actions,
    );
  }
}
