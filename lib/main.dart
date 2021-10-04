import 'package:flutter/material.dart';
import 'package:pdp_ui_3/pages/home_page.dart';
import 'package:pdp_ui_3/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      routes: {
        IntroPage.id:(context) => const IntroPage(),
        HomePage.id:(context) => const HomePage(),
      },
    );
  }
}

