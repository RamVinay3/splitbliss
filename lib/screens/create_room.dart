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
  TextEditingController moneyController = TextEditingController();
  bool creatingRoom = false;

  bool isKeyboardVisible = false;
  @override
  void dispose() {
    roomNameController.dispose();
    moneyController.dispose();
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
    //checks if room title is empty
    if (roomNameController.text.trim().isEmpty) {
      FocusScope.of(context).unfocus();
      Message(context, message: "add a name to your room");
    }
    //check if atleast one user is added
    if (users.length < 1) {
      Message(context, message: 'Add atleast One Member');
      return;
    }
    //get money from here.
    String money = moneyController.text.trim();

    if (selectedOption == 'Deposite Mode' && money.isEmpty) {
      FocusScope.of(context).unfocus();
      Message(context, message: "Add Individual Money to Contribute at intial");
    }

    bool digit = money
        .split('')
        .every((char) => char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57);
    if (selectedOption == 'Deposite Mode' && !digit) {
      FocusScope.of(context).unfocus();
      Message(context, message: "Individual Money must be a number");
    }
    setState(() {
      creatingRoom = true;
    });
    //add the creator (self)
    users.add({
      'userName': userName,
      'color': userColor.toString(),
      'balance': 0,
      'getMoney': 0,
      'email': email,
      'memberId': uid,
      'displayName': displayName
    });
    //create roomId
    var roomId = uuid.v4();
    final Color backgroundColor = getBackGroundColor();
    Map<String, dynamic> obj = {
      'roomTitle': roomNameController.text.trim(),
      'roomId': roomId,
      'admin': userName,
      'members': users,
      // 'balance': 0,
      'spents': 0,
      // 'totalMoney': 0,
      'typeOfMode': (selectedOption == 'Deposite Mode')
          ? RoomType.deposit_mode.name
          : RoomType.no_deposit_mode.name,
      'roomColor': backgroundColor.toString(),
      'transactions': [],
      'remainders': [],
      'polls': [],
      'pending': [],
      'foodPlanner': false,
      'essentials': false,
      'addDishes': false,
      'essentialContent': '',
      'foodPlannerContent': [],
      'dishesContent': [], //items need to be added

      //pending and remainders have requested by attribute
      // so it can be easily accessible
    };
    if (selectedOption == 'Deposite Mode') {
      obj['individualMoney'] = moneyController.text;
    }
    FirebaseFirestore.instance.collection('rooms').doc(roomId).set(obj);
    //add group into every member.

    for (var user in users) {
      await userNameDocs.doc(user['userName']).update({
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
        'userName': value,
        'color': userData!['color'],
        'balance': 0,
        'getMoney': 0,
        'email': userData['email'],
        'memberId': userData['userId'],
        'displayName': userData['displayName']
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
              if (selectedOption == 'Deposite Mode')
                InputContainer(
                    hint: 'Individual Money',
                    keyboardType: TextInputType.number,
                    roomNameController: moneyController),
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
                        user: people['userName'],
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
