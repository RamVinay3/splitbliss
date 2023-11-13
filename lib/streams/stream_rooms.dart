import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/streams/stream_deposit.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/roomCard.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

import '../screens/nodeposit_user.dart';

class StreamRoom extends StatefulWidget {
  const StreamRoom({super.key});

  @override
  State<StreamRoom> createState() => _StreamRoomState();
}

class _StreamRoomState extends State<StreamRoom> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('userDetails')
          .doc(uid!)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: appColors.primary,
            ),
          );
        }

        // Access the array from the document snapshot
        List<dynamic> rooms = snapshot.data!.get('rooms') ?? [];

        if (rooms.isEmpty) {
          return Center(
              child: TextRoboto(
            title: 'Create a room',
            color: appColors.onSurfaceText,
          ));
        }
        print('Streaming now');
        return ListView.builder(
          // shrinkWrap: true,// overflow is avoided
          // physics: NeverScrollableScrollPhysics(), stops inner scrolling
          //you can call single child scroll view outside
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return FutureBuilder<DocumentSnapshot>(
              future: roomsRef.doc(rooms[index]).get(),
              builder: (context, roomSnapshot) {
                if (roomSnapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                }

                if (roomSnapshot.hasError) {
                  print(roomSnapshot.error);
                  return RoomCard(
                    roomName: 'Robot',
                    members: 3,
                  );
                }

                final data = roomSnapshot.data!.data() as Map<String, dynamic>;

                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      if (data['typeOfMode'] == RoomType.deposit_mode.name) {
                        return StreamDeposite(roomId: rooms[index]);
                      } else if (data['typeOfMode'] ==
                          RoomType.no_deposit_mode.name) {
                        return NoDepositeRoom();
                      } else {
                        return StreamRoom();
                      }
                    }));
                  },
                  child: RoomCard(
                    roomName: data['roomTitle'],
                    members: data['members'].length,
                    roomColor: transformColor(data['roomColor']),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
