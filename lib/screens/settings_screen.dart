// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/screens/essentials.dart';
import 'package:splitbliss/screens/food_planner.dart';
import 'package:splitbliss/screens/homeScreen.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodPlanner = widget.room["foodPlanner"];
    essential = widget.room["essentials"];
  }

  void setFoodPlanner(bool value) {
    print(widget.room["roomId"]);
    FirebaseFirestore.instance
        .collection('rooms')
        .doc(widget.room["roomId"])
        .update({'foodPlanner': value}).then((v) {
      setState(() {
        foodPlanner = value;
      });
    });
  }

  void setEssential(bool value) {
    FirebaseFirestore.instance
        .collection('rooms')
        .doc(widget.room["roomId"])
        .update({'essentials': value}).then((v) {
      setState(() {
        essential = value;
      });
    });
  }

  void removingUsersFromRoom(String user) async {
    var userRef = userNameDocs.doc(user);

    var doc = await userRef.get();
    var userInfo = doc.data() as Map<String, dynamic>;
    var userId = userInfo["userId"];
    var userDetailsRef = userUidDocs.doc(userId);

    if (userInfo["rooms"] is List) {
      print("docs is geneated");
      List<dynamic> updatedArray = List.from(userInfo['rooms']);
      updatedArray.removeWhere((item) => item == widget.room["roomId"]);

      // Updating the rooms in users
      userRef.update({'rooms': updatedArray});
      userDetailsRef.update({'rooms': updatedArray});
      // Updating the rooms in users
    }
  }

  void exitingGroup(String user, String roomId, String admin) async {
    //checking the room members and  updating it.
    removingUsersFromRoom(user);
    var roomRef = FirebaseFirestore.instance.collection('rooms').doc(roomId);
    var roomDoc = await roomRef.get();
    var updateRoomMembers = List.from(roomDoc["members"]);
    updateRoomMembers.removeWhere((member) => member["userName"] == userName);
    if (updateRoomMembers.length == 0) {
      roomRef.delete();
    } else if (admin == user) {
      roomRef.update(
          {'members': updateRoomMembers, 'admin': updateRoomMembers[0]});
    } else {
      roomRef.update({'members': updateRoomMembers});
    }
  }

  void _deleteGroup(BuildContext context, String roomId, String admin) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Are you sure, you want to delete the group?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  var roomRef = FirebaseFirestore.instance
                      .collection("rooms")
                      .doc(roomId);
                  var members = widget.room["members"] as List;
                  if (userName == admin) {
                    //Notification will be send incase deleted group.
                    for (int i = 0; i < members.length; i++) {
                      removingUsersFromRoom(members[i]["userName"]);
                    }
                    roomRef.delete();

                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return Home();
                    })).then((_) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    });
                  } else {
                    Navigator.of(context).pop();
                    Message(context,
                        message: 'Only Admins can Delete the Room');
                  }
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  void _exitGroup(BuildContext context, String roomId, String admin) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Are you sure ,you want to exit?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                exitingGroup(userName, roomId, admin);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              child: Text(
                'Exit',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
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
              if ((widget.room['typeOfMode'] == RoomType.deposit_mode.name ||
                  widget.room['typeOfMode'] == RoomType.no_deposit_mode.name))
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          if (!admin) VerticalSpacer(space: 15),
                          InkWell(
                            onTap: () {
                              if (!admin) {
                                if (foodPlanner) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return FoodPlanner();
                                  }));
                                } else {
                                  Message(context,
                                      message:
                                          'Admin restricted the permissions');
                                }
                              }
                            },
                            child: PageCard(
                              path: "lib/svg/foodIcon.svg",
                              title: "Food Planner",
                              onChanged: setFoodPlanner,
                              value: foodPlanner,
                              room: widget.room,
                            ),
                          ),
                          if (!admin) VerticalSpacer(space: 15),
                          InkWell(
                            onTap: () {
                              if (!admin) {
                                if (foodPlanner) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Essentials(
                                      essentialContent:
                                          widget.room["essentialContent"],
                                      roomId: widget.room["roomId"],
                                    );
                                  }));
                                } else {
                                  Message(context,
                                      message:
                                          'Admin restricted the permissions');
                                }
                              }
                            },
                            child: PageCard(
                              path: "lib/svg/essentialIcon.svg",
                              title: "Essentials",
                              onChanged: setEssential,
                              value: essential,
                              room: widget.room,
                            ),
                          ),
                          if (!admin) VerticalSpacer(space: 15),
                        ],
                      )),
                ),
              SizedBox(
                height: (widget.room['typeOfMode'] ==
                            RoomType.no_deposit_mode.name ||
                        widget.room['typeOfMode'] ==
                            RoomType.no_deposit_mode.name)
                    ? 20
                    : 0,
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
                            uname: "@${user['userName']}",
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
                        onTap: () {
                          _exitGroup(context, widget.room["roomId"],
                              widget.room['admin']);
                        },
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
                              "Exit Room",
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
                        onTap: () {
                          _deleteGroup(context, widget.room["roomId"],
                              widget.room["admin"]);
                        },
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
                              "Delete Room",
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
