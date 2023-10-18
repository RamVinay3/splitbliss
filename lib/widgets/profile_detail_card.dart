import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SimpleTile(parameter: 'First Name', value: 'Parijatham'),
            SimpleTile(parameter: 'Last Name', value: 'Chiranjeevi'),
            SimpleTile(parameter: 'Gmail', value: 'chiru@gmail.com'),
            SimpleTile(parameter: 'User Name', value: 'chiru@25 '),
          ],
        ),
      ),
    );
  }
}

class SimpleTile extends StatelessWidget {
  const SimpleTile({super.key, required this.parameter, required this.value});
  final String parameter;
  final String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: TextRoboto(
        title: parameter,
        color: appColors.onPrimaryContainer,
        weight: FontWeight.w500,
        fontsize: 16,
      ),
      trailing: TextRoboto(
        title: value,
        color: appColors.onPrimaryContainer,
        weight: FontWeight.w500,
        fontsize: 16,
      ),
    );
  }
}
