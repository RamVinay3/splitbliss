import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/screens/deposit_mode.dart';

class StreamDeposite extends StatelessWidget {
  const StreamDeposite({super.key, required this.roomId});
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
        final totalMoney =
            (roomInfo['members'].length! - roomInfo['remainders'].length!) *
                roomInfo['individualMoney'];
        return DepositeMode(
          roomInfo: roomInfo,
          totalMoney: totalMoney,
        );
      }),
    );
  }
}
