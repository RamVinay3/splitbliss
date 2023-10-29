import 'package:flutter/material.dart';
import 'package:splitbliss/screens/homeScreen.dart';
import 'package:splitbliss/screens/notification_screen.dart';
import 'package:splitbliss/screens/profile.dart';

class MainTabNavigator extends StatefulWidget {
  const MainTabNavigator({super.key});

  @override
  State<MainTabNavigator> createState() {
    return _Tabs();
  }
}

class _Tabs extends State<MainTabNavigator> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    void selectPage(index) {
      setState(() {
        _selectedPage = index;
      });
    }

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
