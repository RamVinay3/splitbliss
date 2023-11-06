import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class ProfileDetailsCard extends StatefulWidget {
  ProfileDetailsCard({super.key, required this.userName});
  final String userName;

  @override
  State<ProfileDetailsCard> createState() => _ProfileDetailsCardState();
}

class _ProfileDetailsCardState extends State<ProfileDetailsCard> {
  late List<Map<String, String>> vec;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vec = [
      {'FirstName': firstName},
      {'Last Name': secondName},
      {'Gmail': email!},
      {'UserName': widget.userName}
    ];
  }

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
            for (var map in vec)
              for (var entry in map.entries)
                SimpleTile(parameter: entry.key, value: entry.value),
            // SimpleTile(parameter: 'Last Name', value: 'Chiranjeevi'),
            // SimpleTile(parameter: 'Gmail', value: 'chiru@gmail.com'),
            // SimpleTile(parameter: 'User Name', value: 'chiru@25 '),
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
        weight: FontWeight.w400,
        fontsize: 16,
      ),
    );
  }
}
