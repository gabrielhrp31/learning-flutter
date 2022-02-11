import 'package:flutter/material.dart';
import 'package:tarefas/views/tarefas_tela.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Afazeres"),
        backgroundColor: Colors.black,
      ),
      body:TarefasTela(),
    );
  }
}
