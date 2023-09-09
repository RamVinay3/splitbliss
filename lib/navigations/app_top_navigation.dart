import 'package:flutter/material.dart';
import 'package:splitbliss/navigations/main_tab.dart';
import 'package:splitbliss/screens/login.dart';
import 'package:splitbliss/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppTopNavigation extends StatelessWidget {
  AppTopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('something went wrong .please try again'),
          );
        } else if (snapshot.hasData) {
          return const MainTabNavigator();
        } else {
          return const Login();
        }
      },
    );
  }
}
