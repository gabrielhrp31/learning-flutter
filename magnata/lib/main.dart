import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const APP_NAME = "Magnata";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: APP_NAME),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _money = 0.0;

  void _increment_money() {
    setState(() {
      _money+=Random().nextInt(1000).toDouble();
      _money+=(Random().nextInt(1000).toDouble()/1000).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:Center(
          child: Text(
            widget.title,
          )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child:Text(
                "${_money<1000? "Está pobre!":"Está rico!"}",
                style: TextStyle(
                  color: _money<1000? Colors.red:Colors.blue,
                  fontSize: 30,
                ),
              )
          ),
          Center(
              child:Text(
                "R\$ ${_money.toStringAsFixed(2).replaceAll(".", ",")}",
                style: TextStyle(
                  color: _money<1000? Colors.red:Colors.blue,
                  fontSize: 50,
                ),
              )
          ),
          TextButton(
            onPressed: _increment_money,
            child: const Text(
              "Give me!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20.0)),
              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      )
    );
  }
}
