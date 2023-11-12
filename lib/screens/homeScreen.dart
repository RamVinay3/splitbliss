import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/screens/create_room.dart';
import 'package:splitbliss/screens/stream_rooms.dart';
import 'package:splitbliss/widgets/roomCard.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CreateRoom();
            }));
          },
          child: Icon(Icons.add)),
      backgroundColor: appColors.Surface94,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // VerticalSpacer(space: height * 0.035),
              TextRoboto(
                  title: 'My Expenses',
                  color: appColors.onSurfaceText,
                  weight: FontWeight.w700),
              VerticalSpacer(space: 0.023 * height),
              RoomCard(personal: true),
              VerticalSpacer(space: 0.012 * height),
              TextRoboto(
                title: 'Rooms',
                color: appColors.onSurfaceText,
                weight: FontWeight.w700,
              ),
              VerticalSpacer(space: 0.023 * height),

              Expanded(child: StreamRoom())
            ],
          ),
        ),
      ),
    );
  }
}
