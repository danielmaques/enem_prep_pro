import 'package:enem_prep_pro/module/home/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
          color: Colors.white,
        )),
        scaffoldBackgroundColor: const Color(0xFF191B1F),
        backgroundColor: const Color(0xFF191B1F),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
