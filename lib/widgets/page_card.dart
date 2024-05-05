// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:splitbliss/screens/essentials.dart';
import 'package:splitbliss/screens/food_planner.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/svg.dart';

class PageCard extends StatelessWidget {
  PageCard(
      {required this.path,
      required this.title,
      required this.onChanged,
      required this.value,
      required this.room});

  String path, title;
  bool value;
  Map<String, dynamic> room;
  Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SVG(svgPath: path),
            SizedBox(width: 15),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
            if (room["admin"] == userName)
              Transform.scale(
                scale: 1.2,
                child: Switch.adaptive(
                  value: value,
                  activeColor: Color(0xFFF8CECE),
                  activeTrackColor: Color(0xFF5FB3E3),
                  onChanged: onChanged,
                ),
              ),
            SizedBox(width: 50),
            InkWell(
                onTap: () {
                  if (title == "Food Planner") {
                    if (room["foodPlanner"]) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FoodPlanner();
                      }));
                    } else {
                      Message(context,
                          message: 'Admin restricted the permissions');
                    }
                  } else {
                    if (room["essentials"]) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Essentials(
                          roomId: room["roomId"],
                          essentialContent: room["essentialContent"],
                        );
                      }));
                    } else {
                      Message(context,
                          message: 'Admin restricted the permissions');
                    }
                  }
                },
                child: SVG(svgPath: "lib/svg/rightArrow.svg")),
          ],
        ),
      ],
    );
  }
}
