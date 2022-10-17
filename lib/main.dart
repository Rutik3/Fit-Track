import 'package:fit_track/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit-Track',
      home: BNavBar(
        selectedPage: 0,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
