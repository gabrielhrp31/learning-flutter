import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List locais = [
    'Rio de Janeiro',
    'São Francisco',
    'Paris',
    'Curitiba',
    'Lisboa',
    'Moscou',
    'Pequim'
  ];

  List<MaterialColor> cores = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.amber,
    Colors.grey,
    Colors.deepOrange
  ];

  MaterialColor cor = Colors.blue;
  String cidade = 'Rio de Janeiro';

  _getRandData(){
    var rng = Random();
    setState(() {
      cor  = cores[rng.nextInt(cores.length)];
      cidade = locais[rng.nextInt(locais.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "Locais"
              )
            ],
          ),
        ),
        body:Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: _getRandData,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(cor),
                  ),
                  child:const Text('Clique Aqui', style: TextStyle(color: Colors.white),)
              ),
              Text(cidade)
            ],
          ),
        )
    );
  }
}

