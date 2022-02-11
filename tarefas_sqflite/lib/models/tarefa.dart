import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tarefa extends StatelessWidget {
  late int _id;
  late String _nome;
  late String _dataCriacao;


  Tarefa(this._id, this._nome, this._dataCriacao, {Key? key}) : super(key: key);



  Tarefa.map( dynamic obj, {Key? key}): super(key: key){
    _id = obj["id"];
    _nome = obj["nome"];
    _dataCriacao = obj["dataCriacao"];
  }

  Tarefa.fromMap(Map<String, dynamic> map, {Key? key}): super(key: key){
    _id = map["id"];
    _nome = map["nome"];
    _dataCriacao = map["dataCriacao"];
  }

  int get id => _id;
  String get nome => _nome;
  String get dataCriacao => _dataCriacao;

  Map<String, dynamic> toMap(){
    var map =  <String, dynamic>{};
    if(id!=null){
      map["id"] = id;
    }
    map["nome"] = nome;
    map["dataCriacao"] = dataCriacao;
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8.0),
      child: Row(
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _nome,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 16.9
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:5.0),
                child: Text(
                  "Criado em $dataCriacao",
                  style: const TextStyle(
                      color:Colors.white60,
                      fontWeight:FontWeight.bold,
                      fontSize: 12
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
