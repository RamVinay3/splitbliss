// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:splitbliss/screens/add_payment.dart';
import 'package:splitbliss/screens/payment_history.dart';
import 'package:splitbliss/screens/remainder_screen.dart';
import 'package:splitbliss/screens/settings_screen.dart';
import 'package:splitbliss/widgets/menu_item.dart';
import 'package:splitbliss/widgets/svg.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key, required this.room});
  final Map<String, dynamic> room;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.values[1],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      icon: SVG(svgPath: "lib/svg/threeDotsWhite.svg"),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddPayment();
            }));
          },
          child: MenuItem(
              path: "lib/svg/addPaymentIcon.svg", title: "Add Payments"),
          value: 1,
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PaymentHistory();
            }));
          },
          child: MenuItem(path: "lib/svg/historyIcon.svg", title: "History"),
          value: 2,
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Remainder();
            }));
          },
          child:
              MenuItem(path: "lib/svg/remainderIcon.svg", title: "Remainder"),
          value: 3,
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SettingsScreen(
                room: room,
              );
            }));
          },
          child: MenuItem(path: "lib/svg/settingsIcon.svg", title: "Settings"),
          value: 4,
        ),
      ],
    );
  }
}
