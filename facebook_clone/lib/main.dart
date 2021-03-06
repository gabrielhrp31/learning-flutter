import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/screens/screens.dart';
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
      title: 'Facebok Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity:VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor:Palette.scaffold,
      ),
      home: HomeScreen()
    );
  }
}
