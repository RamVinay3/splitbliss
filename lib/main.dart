// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:splitbliss/navigations/app_top_navigation.dart';
import 'package:splitbliss/screens/add_poll.dart';
import 'package:splitbliss/screens/deposit_mode.dart';
import 'package:splitbliss/screens/essentials.dart';
import 'package:splitbliss/screens/food_planner.dart';
import 'package:splitbliss/screens/login.dart';
import 'package:splitbliss/screens/nodeposit_user.dart';
import 'package:splitbliss/screens/notification_screen.dart';
import 'package:splitbliss/screens/payment_history.dart';
import 'package:splitbliss/screens/profile.dart';
import 'package:splitbliss/screens/settings_screen.dart';
import 'package:splitbliss/screens/splash.dart';
import 'package:splitbliss/screens/work_scheduler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Supabase.initialize(
  //   url: 'https://qservkhijlzeodddipbb.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzZXJ2a2hpamx6ZW9kZGRpcGJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQyNDQ3ODMsImV4cCI6MjAwOTgyMDc4M30.grBOCunYY6iAZHi-gi4AyBlfhYoU2YdSCp4k2CxHgaQ',
  // );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

final supabase = Supabase.instance.client;
