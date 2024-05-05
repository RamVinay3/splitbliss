import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/title_bar.dart';

class Essentials extends StatefulWidget {
  const Essentials(
      {super.key, required this.roomId, required this.essentialContent});

  final String roomId;
  final String essentialContent;

  @override
  State<Essentials> createState() => _EssentialsState();
}

class _EssentialsState extends State<Essentials> {
  TextEditingController essentialController = TextEditingController();
  void dispose() {
    super.dispose();
    essentialController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    essentialController.text = widget.essentialContent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: 'Essentials', actions: [
        TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('rooms')
                  .doc(widget.roomId)
                  .update({'essentialContent': essentialController.text});
            },
            child: Text(
              'SAVE',
              style: TextStyle(color: appColors.onPrimary),
            ))
      ]),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: TextFormField(
          autofocus: true,
          controller: essentialController,
          // expands: true,
          cursorWidth: 2,
          autocorrect: true,
          maxLines: null,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:
                "Don't forget things to bring back home when you are outside,write here to remember",
            hintMaxLines: 3,
          ),
          cursorColor: appColors.primary,
          enableSuggestions: true,
        ),
      ),
    );
  }
}
