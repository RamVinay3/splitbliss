// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key, required this.onPress,required this.searchController});
  final void Function() onPress;
  final TextEditingController searchController;
  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFD9D9D9),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Add a Member",
                ),
              ),
            ),
            ElevatedButton(
              onPressed:widget.onPress,
              //  () {
                // widget.onPress();
                // if (response) {
                //   searchController.clear();
                //   searchController = TextEditingController();
                // }
              // },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}
