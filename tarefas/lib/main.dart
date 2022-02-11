import 'package:flutter/material.dart';
import 'package:tarefas/views/home.dart';

void main() {
  runApp(const Tarefas());
}
class Tarefas extends StatelessWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Afazeres",
      home: Home()
    );
  }
}
