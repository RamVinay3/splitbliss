// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/radio_button.dart';
import 'package:splitbliss/widgets/user_card.dart';

import '../colors.dart';
import '../widgets/bottom_button.dart';
import '../widgets/input_container.dart';
import '../widgets/search_container.dart';
import '../widgets/title_bar.dart';

List<String> options = [
  'No Deposite Mode',
  'Deposite Mode',
];

class CreateRoom extends StatelessWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: "Create Room"),
      resizeToAvoidBottomInset: false,
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
  List<Map<String, dynamic>> users = [];
  String selectedOption = options[0];
  TextEditingController roomNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool creatingRoom = false;
  bool isKeyboardVisible = false;
  @override
  void dispose() {
    roomNameController.dispose();
    super.dispose();
    searchController.dispose();
    if (isKeyboardVisible) {
      FocusScope.of(context).unfocus();
    }
  }

  void setSelectedOption(String? value) {
    setState(() {
      selectedOption = value.toString();
    });
  }

  void removeUser(String value) {
    int index = users.indexWhere((user) => user['memberName'] == value);
    setState(() {
      users.remove(users[index]);
    });
  }

  void makeRoom() async {
    if (users.length < 1) {
      Message(context, message: 'Add atleast One Member');
      return;
    }
    if (roomNameController.text.isEmpty) {
      FocusScope.of(context).unfocus();
      Message(context, message: "add a name to your room");
    }
    setState(() {
      creatingRoom = true;
    });
    //add the creator (self)
    users.add({
      'memberName': userName,
      'color': userColor.toString(),
      'spents': 0,
      'debts': 0,
      'email': email,
      'memberId': uid
    });
    //create roomId
    var roomId = uuid.v4();
    final Color backgroundColor = getBackGroundColor();
    FirebaseFirestore.instance.collection('rooms').doc(roomId).set({
      'roomTitle': roomNameController.text.trim(),
      'roomId': roomId,
      'admin': userName,
      'members': users,
      'balance': 0,
      'spents': 0,
      'totalMoney': 0,
      'typeOfMode': (selectedOption == 'Deposite Mode')
          ? RoomType.deposit_mode.name
          : RoomType.no_deposit_mode.name,
      'roomColor': backgroundColor.toString(),
      'transactions': [],
      'remainders': [],
      'polls': [],
    });
    //add group into every member.

    for (var user in users) {
      await userNameDocs.doc(user['memberName']).update({
        'rooms': FieldValue.arrayUnion([roomId]),
      });
      await userUidDocs.doc(user['memberId']).update({
        'rooms': FieldValue.arrayUnion([roomId]),
      });
      setState(() {
        creatingRoom = false;
      });
    }

//just remove this screen.
    Navigator.of(context).pop();
  }

  void addUsers() async {
    String value = searchController.text.trim();

    //check if user is already present in array.
    bool isUserPresent = users.any((map) => map.containsValue(value));
    if (isUserPresent) {
      FocusScope.of(context).unfocus();
      Message(context, message: 'User already added');
      return;
    }

    //check if he himself adding into group.
    if (value == userName) {
      FocusScope.of(context).unfocus();
      Message(context,
          message: "You are the creator of group.Don't need to add yourself");
      return;
    }
    final user = await userNameDocs.doc(value).get();

    //if he exists in database
    if (!user.exists) {
      FocusScope.of(context).unfocus();
      Message(context, message: "User does not exists");
      return;
    }
    Map<String, dynamic>? userData = user.data() as Map<String, dynamic>?;

    setState(() {
      users.add({
        'memberName': value,
        'color': userData!['color'],
        'spents': 0,
        'debts': 0,
        'email': userData['email'],
        'memberId': userData['userId']
      });
    });
    searchController.clear();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    if (creatingRoom) {
      return Center(
        child: CircularProgressIndicator(
          color: appColors.primary,
        ),
      );
    }
    return Container(
      // color: Colors.yellow,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              InputContainer(
                  hint: 'Enter Room Name',
                  keyboardType: TextInputType.text,
                  roomNameController: roomNameController),
              SizedBox(height: 20),
              Row(
                children: [
                  RadioButton(
                      value: options[0],
                      groupValue: selectedOption,
                      onChanged: setSelectedOption),
                  RadioButton(
                      value: options[1],
                      groupValue: selectedOption,
                      onChanged: setSelectedOption),
                ],
              ),
              SizedBox(height: 20),
              SearchContainer(
                  onPress: addUsers, searchController: searchController),
              SizedBox(height: 20),
              Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  for (var people in users)
                    UserCard(
                        user: people['memberName'],
                        color: people['color'] is Color
                            ? people['color']
                            : transformColor(people['color']).withAlpha(100),
                        onPress: removeUser),
                ],
              )
            ],
          ),
          BottomButton(
            title: "Create Room",
            color: appColors.primary,
            onPress: makeRoom,
          )
        ],
      ),
    );
  }
}
