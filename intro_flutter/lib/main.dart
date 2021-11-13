import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title:"Olá",
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.blueAccent,
      child: Container(
        child: const Center(
            child: Text(
                'Alo Gabriel',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 34.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                )
            )
        ),
      ),
    );
  }
}