// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/radio_button.dart';
import 'package:splitbliss/widgets/user_card.dart';
import '../widgets/input_container.dart';
import '../widgets/search_container.dart';
import '../widgets/bottom_button.dart';
import '../widgets/title_bar.dart';

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

List<String> options = [
  'No Deposite Mode',
  'Deposite Mode',
];

List<String> users = [];

class _BodyState extends State<Body> {
  String selectedOption = options[0];
  TextEditingController roomNameController = TextEditingController();
  @override
  void dispose() {
    roomNameController.dispose();
    super.dispose();
  }

  void setSelectedOption(String? value) {
    setState(() {
      selectedOption = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SearchContainer(),
              SizedBox(height: 20),
              Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  UserCard(
                      user: "@Vinay3",
                      color: Color.fromARGB(255, 215, 140, 239)),
                  UserCard(
                      user: "@Chiru2345",
                      color: Color.fromARGB(255, 102, 228, 142)),
                  UserCard(
                      user: "@Nagasai2345",
                      color: Color.fromARGB(255, 136, 125, 218)),
                  UserCard(
                      user: "@Smauel423121",
                      color: Color.fromARGB(255, 214, 139, 139)),
                  UserCard(
                      user: "@Shivakiran41323",
                      color: const Color.fromARGB(255, 245, 109, 154)),
                  UserCard(
                      user: "@Prasanth123",
                      color: Color.fromARGB(255, 159, 238, 149)),
                ],
              )
            ],
          ),
          BottomButton(title: "Create Room")
        ],
      ),
    );
  }
}
