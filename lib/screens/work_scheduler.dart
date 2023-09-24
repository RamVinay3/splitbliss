import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/dummy_data/work_schedule.dart';
import 'package:splitbliss/models/work_schedule.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/title_bar.dart';

class WorkScheduler extends StatefulWidget {
  const WorkScheduler({super.key});

  @override
  State<WorkScheduler> createState() => _WorkSchedulerState();
}

class _WorkSchedulerState extends State<WorkScheduler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: 'Work Scheduler',
      ),
      body: ListView(
        children: workSchedules.map<Widget>((WorkSchedule item) {
          return ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(10.0),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                item.expanded = isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.header),
                  );
                },
                body: Container(
                  decoration: BoxDecoration(color: appColors.primaryContainer),
                  child: Column(
                    children: [
                      for (int i = 0; i < item.body.length; i++)
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextRoboto(
                                title: work[i],
                                color: appColors.onPrimaryContainer,
                                weight: FontWeight.w500,
                              ),
                              TextRoboto(
                                title: item.body[i],
                                color: appColors.onPrimaryContainer,
                                weight: FontWeight.w500,
                                fontsize: 16,
                              ), // First string
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                isExpanded: item.expanded,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
