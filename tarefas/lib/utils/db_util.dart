import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:tarefas/models/tarefa.dart';
import 'package:localstore/localstore.dart';

class DbUtil {
  static final DbUtil _instance = DbUtil.internal();

  factory DbUtil() => _instance;

  final String nomeTabela = "tarefas";

  static final _db = Localstore.instance;

  get db  {
      return _db;
  }

  DbUtil.internal();

  //CRUD - CREATE, READ, UPDATE, DELETE

  //INSERIR
  Future<String> inserir(Tarefa tarefa) async {
    final id = db.collection(nomeTabela).doc().id;
    tarefa.id = id;
    await db.collection(nomeTabela).doc(id).set(tarefa.toMap());
    return id;
  }

  //Retirar ou Pegar
  Future<List> buscarTodos() async {
    var result = await db.collection(nomeTabela).get();
    List<dynamic> lista = [];
    if(result!=null){
      result.forEach((k, v) => lista.add(v));
    }
    return lista;
  }

  //Pegar tarefa atravez da sua ID
  Future<Tarefa> buscar(String id) async {
    var result = await db.collection(nomeTabela).doc(id).get();
    return Tarefa.map(result);
  }

  //Apagar or deletar
  Future<void> apagar(String id) async {
    await db.collection(nomeTabela).doc(id).delete();
  }

  //Atualizar tarefa

  Future<String> atualizar(Tarefa tarefa) async {
    await db.collection(nomeTabela).doc(tarefa.id).set(tarefa.toMap());
    return tarefa.id;
  }

}
