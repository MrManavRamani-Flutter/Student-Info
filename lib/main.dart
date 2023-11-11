// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_info/page/add_info.dart';
import 'package:student_info/page/find_info.dart';
import 'package:student_info/page/home_page.dart';
import 'package:student_info/page/view_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (contact) => Home_Page(),
        'add_info': (contact) => Add_Info(),
        'view_info': (context) => View_Info(),
        'find_data': (context) => Find_Data(),
      },
    );
  }
}
