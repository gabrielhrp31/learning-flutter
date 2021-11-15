
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pesquisar extends StatelessWidget {

  var _cidadeCampoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Pesquisar Cidade"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
                "assets/white_snow.png",
                width: double.infinity,
                height: double.infinity,
                fit:BoxFit.cover
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: const InputDecoration(
                      hintText: "Cidade"
                  ),
                  controller: _cidadeCampoController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextButton(
                  child: const Text("Pesquisar"),
                  onPressed: (){
                    Navigator.pop(context,{"cidade":_cidadeCampoController.text});
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
