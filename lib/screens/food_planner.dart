import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/models/foodPlanner.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/title_bar.dart';
import 'package:splitbliss/dummy_data/food_planner.dart';

class FoodPlanner extends StatefulWidget {
  const FoodPlanner({super.key});

  @override
  State<FoodPlanner> createState() => _FoodPlannerState();
}

class _FoodPlannerState extends State<FoodPlanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: 'Food Planner',
      ),
      body: ListView(
        children: food.map<Widget>((Food item) {
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListTile(
                            title: TextRoboto(
                              title: work[i],
                              color: appColors.onPrimaryContainer,
                              weight: FontWeight.w500,
                            ),
                            trailing: TextRoboto(
                              title: item.body[i],
                              color: appColors.onPrimaryContainer,
                              weight: FontWeight.w500,
                              fontsize: 16,
                            ),
                          ),
                        )
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
