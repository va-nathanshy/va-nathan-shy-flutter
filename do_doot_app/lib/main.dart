import 'package:flutter/material.dart';
import 'package:do_doot_app/theme/theme.dart';
//pages
import 'package:do_doot_app/screens/home.dart';
//data
import 'package:do_doot_app/database/task_db.dart';
import 'package:do_doot_app/database/category_db.dart';

void main() {
  runApp(const MyApp());
  TaskDb().generateSampleData();
  CategoryDb().generateSampleData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}
