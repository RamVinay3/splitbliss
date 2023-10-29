// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/menu_item.dart';
import 'package:splitbliss/widgets/svg.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.values[1],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      icon: SVG(svgPath: "lib/svg/threeDotsWhite.svg"),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: MenuItem(
              path: "lib/svg/addPaymentIcon.svg", title: "Add Payments"),
          value: 1,
        ),
        PopupMenuItem(
          child: MenuItem(path: "lib/svg/historyIcon.svg", title: "History"),
          value: 2,
        ),
        PopupMenuItem(
          child:
              MenuItem(path: "lib/svg/remainderIcon.svg", title: "Remainder"),
          value: 3,
        ),
        PopupMenuItem(
          child: MenuItem(path: "lib/svg/settingsIcon.svg", title: "Settings"),
          value: 4,
        ),
      ],
    );
  }
}
