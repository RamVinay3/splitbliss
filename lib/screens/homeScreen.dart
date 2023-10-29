import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/dummy_data/room.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/screens/create_room.dart';
import 'package:splitbliss/screens/deposit_mode.dart';
import 'package:splitbliss/screens/nodeposit_user.dart';
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
      body: SingleChildScrollView(
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
              if (rooms.length == 0)
                Center(
                    child: TextRoboto(
                  title: 'Create a room',
                  color: appColors.onSurfaceText,
                )),
              for (int i = 0; i < rooms.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      if (rooms[i].room == RoomType.deposit_mode) {
                        return DepositeMode();
                      } else if (rooms[i].room == RoomType.no_deposit_mode) {
                        return NoDepositeRoom();
                      } else {
                        return NoDepositeRoom();
                      }
                    }));
                  },
                  child: RoomCard(
                    members: rooms[i].members,
                    roomName: rooms[i].name,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
