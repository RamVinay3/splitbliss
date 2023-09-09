// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/member_card.dart';
import 'package:splitbliss/widgets/page_card.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/title_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: "Settings"),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    return Container(
        color: Color(0xFFF0F0F0),
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Center(child: HistoryProfile(title: "GF", size: 120,)),
            SizedBox(height: 10,),
            Center(
              child: Text("Gear Five", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 5,),
            Center(child: Text("Room 5 People", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),
            SizedBox(height: 20,),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    PageCard(path: "lib/svg/foodIcon.svg", title: "Food Planner", onChanged: setFoodPlanner, value: foodPlanner,),
                    PageCard(path: "lib/svg/essentialIcon.svg", title: "Essentials", onChanged: setEssential, value: essential,),
                  ],
                )
              ),
            ),
            SizedBox(height: 20,),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          SVG(svgPath: "lib/svg/addPeopleIcon.svg"),
                          SizedBox(width: 15,),
                          Text("Add People", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    MemberCard(name: "Chiru Pari", uname: "@Chiru25", profile: "CP",),
                    SizedBox(height: 10,),
                    MemberCard(name: "Ram Vinay", uname: "@Ramvinay79033", profile: "RV",),
                    SizedBox(height: 10,),
                    MemberCard(name: "Samuel Samantha", uname: "@Sasa456", profile: "SS",),
                    SizedBox(height: 10,),
                    MemberCard(name: "Naga Sai", uname: "@Nagasai234", profile: "NS",),
                    SizedBox(height: 10,),
                    MemberCard(name: "Shiva Sheema", uname: "@helenaCheyakuBro", profile: "SS",),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          SVG(svgPath: "lib/svg/exitGroupIcon.svg"),
                          SizedBox(width: 15,),
                          Text("Exit Group", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFFFF0000)),),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          SVG(svgPath: "lib/svg/deleteGroupIcon.svg"),
                          SizedBox(width: 15,),
                          Text("Delete Group", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFFFF0000)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
