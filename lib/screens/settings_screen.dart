// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/member_card.dart';
import 'package:splitbliss/widgets/page_card.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/title_bar.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.room});
  final Map<String, dynamic> room;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool foodPlanner = false;

  bool essential = false;

  void setFoodPlanner(bool value) {
    setState(() {
      foodPlanner = value;
    });
  }

  void setEssential(bool value) {
    setState(() {
      essential = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool admin = widget.room['admin'] == userName;
    return Scaffold(
      appBar: TitleBar(title: "Settings"),
      body: Container(
          color: Color(0xFFF0F0F0),
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Center(
                  child: HistoryProfile(
                title: getCustomisedCharacters(widget.room['roomTitle']),
                size: 120,
                color: transformColor(widget.room['roomColor']),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.room['roomTitle'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "${(widget.room['typeOfMode'] == RoomType.no_deposit_mode.name ? "No Deposit Mode" : "Deposit Mode")}. ${widget.room['members'].length} Members.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if ((admin || foodPlanner || essential) &&
                  widget.room['typeOfMode'] == RoomType.deposit_mode.name)
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          PageCard(
                            path: "lib/svg/foodIcon.svg",
                            title: "Food Planner",
                            onChanged: setFoodPlanner,
                            value: foodPlanner,
                          ),
                          PageCard(
                            path: "lib/svg/essentialIcon.svg",
                            title: "Essentials",
                            onChanged: setEssential,
                            value: essential,
                          ),
                        ],
                      )),
                ),
              SizedBox(
                height:
                    (widget.room['typeOfMode'] == RoomType.no_deposit_mode.name)
                        ? 0
                        : 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SVG(svgPath: "lib/svg/addPeopleIcon.svg"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Add People",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            VerticalSpacer(space: 5)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (var user in widget.room['members'])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: MemberCard(
                            name: user['displayName'],
                            uname: "@${user['memberName']}",
                            profile:
                                getCustomisedCharacters(user['displayName']),
                            color: user['color'],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SVG(svgPath: "lib/svg/exitGroupIcon.svg"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Exit Group",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                // color: Color(0xFFFF0000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SVG(svgPath: "lib/svg/deleteGroupIcon.svg"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Delete Group",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                // color: Color(0xFFFF0000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
