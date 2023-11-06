import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbliss/screens/homeScreen.dart';
import 'package:splitbliss/screens/notification_screen.dart';
import 'package:splitbliss/screens/profile.dart';
import 'package:splitbliss/screens/set_profile.dart';

class MainTabNavigator extends ConsumerStatefulWidget {
  const MainTabNavigator({super.key});

  @override
  ConsumerState<MainTabNavigator> createState() {
    return _Tabs();
  }
}

class _Tabs extends ConsumerState<MainTabNavigator> {
  int _selectedPage = 0;
  bool doc = true;
  final currentUser = FirebaseAuth.instance.currentUser;

  void CreateUserInfo(String username, Color background) {
    String name = currentUser!.displayName!;
    CollectionReference users =
        FirebaseFirestore.instance.collection('userDetails');

    try {
      users.doc(currentUser!.uid).set({
        'displayName': name,
        'userName': username,
        'color': background.toString(),
        'email': currentUser!.email
      });
      setState(() {
        doc = true;
      });
    } catch (error) {
      print(error);
    }
  }

  void selectPage(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void checkDoc() async {
    final docs = await FirebaseFirestore.instance
        .collection('userDetails')
        .doc(currentUser!.uid)
        .get();
    if (docs.exists) {
      setState(() {
        doc = true;
      });
    } else {
      setState(() {
        doc = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDoc();
  }

  @override
  Widget build(BuildContext context) {
    if (!doc) {
      return SetProfile(
        createUserInfo: CreateUserInfo,
      );
    }
    // print(doc);

    Widget activePage = Home();
    if (_selectedPage == 1) {
      activePage = NotificationScreen();
    } else if (_selectedPage == 2) {
      activePage = Profile();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) {
          selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
