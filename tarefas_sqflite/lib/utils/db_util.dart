import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tarefas_sqflite/models/tarefa.dart';

class DbUtil {
  static final DbUtil _instance = DbUtil.internal();

  factory DbUtil() => _instance;

  final String nomeTabela = "tarefas";
  final String colunaId = "id";
  final String colunaNome = "nome";
  final String colunaDataCriacao = "dataCriacao";

  static Database? _db ;

  Future<Database?> get db async {
    if(_db!=null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DbUtil.internal();

  initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await getDatabasesPath(), '$nomeTabela.db');
    var nossoDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return nossoDb;
  }

  void _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $nomeTabela($colunaId INTEGER PRIMARY KEY,"
        "$colunaNome TEXT,"
        "$colunaDataCriacao TEXT)");
  }

  //CRUD - CREATE, READ, UPDATE, DELETE

  //INSERIR
  Future<int> inserir(Tarefa tarefa) async {
    var bdCliente = await db;
    int res = await bdCliente!.insert(nomeTabela, tarefa.toMap());
    return res;
  }

  //Retirar ou Pegar
  Future<List> buscarTodos() async {
    var bdCliente = await db;
    var res = await bdCliente!.rawQuery("SELECT * FROM $nomeTabela");

    return res.toList();
  }

  //Contagem
  Future<int?> contarTodos() async {
    var bdCliente = await db;
    return Sqflite.firstIntValue(
        await bdCliente!.rawQuery("SELECT COUNT(*) FROM $nomeTabela"));
  }

  //Pegar tarefa atravez da sua ID
  Future<Tarefa?> buscar(int id) async {
    var bdCliente = await db;
    var res = await bdCliente!.rawQuery("SELECT * FROM $nomeTabela"
        " WHERE $colunaId = $id");
    if (res.length == 0) return null;
    return Tarefa.fromMap(res.first);
  }

  //Apagar or deletar
  Future<int> apagar(int id) async {
    var bdCliente = await db;

    return await bdCliente!.delete(nomeTabela,
        where: "$colunaId = ?", whereArgs: [id]);
  }

  //Atualizar tarefa

  Future<int> atualizar(Tarefa tarefa) async {
    var bdCliente = await db;
    return await bdCliente!.update(nomeTabela,
        tarefa.toMap(), where: "$colunaId = ?", whereArgs: [tarefa.id]);
  }

  Future fechar() async {
    var bdCliente = await db;
    return bdCliente!.close();
  }

}
