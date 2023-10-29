import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/ask_text.dart';
import 'package:splitbliss/widgets/bottom_button.dart';
import 'package:splitbliss/widgets/input_container.dart';
import 'package:splitbliss/widgets/title_bar.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class AddPoll extends StatefulWidget {
  const AddPoll({super.key});

  @override
  State<AddPoll> createState() => _AddPollState();
}

class _AddPollState extends State<AddPoll> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    questionController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: TitleBar(title: 'Create Poll'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          0.053 * screenWidth,
          0.035 * screenHeight,
          0.053 * screenWidth,
          0.029 * screenHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextPoll(text: 'Ask Question'),
                  VerticalSpacer(space: 0.011 * screenHeight),
                  InputContainer(
                    hint: 'Ask Question',
                    roomNameController: questionController,
                    keyboardType: TextInputType.text,
                  ),
                  VerticalSpacer(space: 0.017 * screenHeight),
                  const TextPoll(text: 'Options'),
                  VerticalSpacer(space: 0.011 * screenHeight),
                  InputContainer(
                    hint: 'Option 1',
                    roomNameController: option1Controller,
                    keyboardType: TextInputType.text,
                  ),
                  VerticalSpacer(space: 0.011 * screenHeight),
                  InputContainer(
                    hint: 'Option 2',
                    roomNameController: option2Controller,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: BottomButton(
                title: 'Create Poll',
                onPress: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
