// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_not_empty, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/poll_card.dart';
import 'package:splitbliss/widgets/svg.dart';

class PollTab extends StatelessWidget {
  PollTab({super.key});

  List<Map<String, String>> pollList = [];

  List options = [
    "Chicken",
    "Mutton",
  ];

  String value = "";

  @override
  Widget build(BuildContext context) {
    if (!pollList.isEmpty) {
      return Container(
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVG(svgPath: "lib/svg/pollIcon.svg"),
            SizedBox(height: 10),
            Text("Create a Poll\n know the opinions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF606060))),
          ],
        )),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [PollCard()],
        ),
      );
    }
  }
}
