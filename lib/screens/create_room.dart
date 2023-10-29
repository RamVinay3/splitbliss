// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
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
  @override
  void dispose() {
    roomNameController.dispose();
    super.dispose();
    searchController.dispose();
  }

  void setSelectedOption(String? value) {
    setState(() {
      selectedOption = value.toString();
    });
  }

  void removeUser(String value) {
    int index = users.indexWhere((user) => user['name'] == value);
    setState(() {
      users.remove(users[index]);
    });
  }

  void addUsers() {
    String value = searchController.text;
    //check if user is present in database.
    //check if user is already present in array.
    //check if he himself adding into group.
    //above all are false cases

    RandomColor _randomColor = RandomColor();
    Color backgroundColor = _randomColor.randomColor(
      colorBrightness: ColorBrightness.veryLight,
    );
    setState(() {
      users.add({'name': value, 'color': backgroundColor});
    });
    searchController.clear();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                        user: people['name'],
                        color: people['color'],
                        onPress: removeUser),
                ],
              )
            ],
          ),
          BottomButton(
            title: "Create Room",
            color: appColors.primary,
            onPress: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
