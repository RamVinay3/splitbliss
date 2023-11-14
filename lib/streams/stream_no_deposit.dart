import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/screens/nodeposit_user.dart';

class StreamNoDeposit extends StatelessWidget {
  const StreamNoDeposit({super.key, required this.roomId});
  final String roomId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .snapshots(),
      builder: ((context, snapshot) {
        //if there is no data found
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: appColors.primary,
            ),
          );
        }

        Map<String, dynamic> roomInfo = snapshot.data!.data()!;

        return NoDepositeRoom(
          roomInfo: roomInfo,
        );
      }),
    );
  }
}
