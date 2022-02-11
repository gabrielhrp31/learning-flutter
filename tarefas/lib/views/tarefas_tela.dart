import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/models/tarefa.dart';
import 'package:tarefas/utils/db_util.dart';
import 'package:intl/date_symbol_data_local.dart';

class TarefasTela extends StatefulWidget {
  const TarefasTela({Key? key}) : super(key: key);

  @override
  _TarefasTelaState createState() => _TarefasTelaState();
}

class _TarefasTelaState extends State<TarefasTela> {

  final TextEditingController _controller = TextEditingController();

  var db = DbUtil();

  final List<Tarefa> _listaTarefas = <Tarefa>[];

  @override
  void initState() {
    super.initState();
    _buscarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                  itemCount: _listaTarefas.length,
                  itemBuilder: (_, int posicao){
                    return Card(
                      color: Colors.black87,
                      child: ListTile(
                        title: _listaTarefas[posicao],
                        onLongPress: ()=>_mostraForm(context, _listaTarefas[posicao].id, posicao),
                        trailing: Listener(
                          key:Key(_listaTarefas[posicao].id.toString()),
                          child:Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                          ),
                          onPointerDown: (pointerEvent)=>apagar(_listaTarefas[posicao].id, posicao),
                        ),
                      ),
                    );
                  }
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const ListTile(
          title: Icon(Icons.add),
        ),
        onPressed:()=> _mostraForm(context, null, null),
      ),
    );
  }

  void _buscarTarefas() async {
    List tarefas = await db.buscarTodos();
    if(tarefas!=null){
      tarefas.forEach((tarefa) {
        setState(() {
          _listaTarefas.add(Tarefa.map(tarefa));
        });
      });
    }
  }

  _mostraForm(context, String? id, int? index) async {
    if(id!=null){
      Tarefa tarefa = await db.buscar(id);
      _controller.text = tarefa.nome;
    }
    var alert = AlertDialog(
      content: Row(
        children: [
          Expanded(
              child: TextField(
                controller: _controller,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "Tarefa",
                    hintText: "Ex.: Cozinhar Feijão",
                    icon:Icon(Icons.note_add)
                ),
              )
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed:()=>_lidarComTexto(context, id, index),
            child: index!=null ? Text("Salvar") : Text("Adicionar")
        )
      ],
    );
    showDialog(context: context,
        builder:(_){
          return alert;
        }
    );
  }

  _lidarComTexto(context, String? id, int? index) async {
    Tarefa tarefa;
    String idSalvo;
    if(index!=null && id!=null){
      tarefa = await db.buscar(id);
      tarefa.nome = _controller.text;
      idSalvo = await db.atualizar(tarefa);
      tarefa = await db.buscar(idSalvo);
      setState(() {
        _listaTarefas.removeAt( index);
        _listaTarefas.insert(index, tarefa);
      });
    }else {
      tarefa = Tarefa(_controller.text, dataFormatada());
      idSalvo = await db.inserir(tarefa);
      tarefa = await db.buscar(idSalvo);
      setState(() {
        _listaTarefas.add(tarefa);
      });
    }
    _controller.clear();
    Navigator.pop(context);
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador =  DateFormat.yMMMMd("pt_BR");
    return formatador.format(agora);
  }

  apagar(String id, int posicao  ) async {
    await db.apagar(id);
    setState(() {
      _listaTarefas.removeAt(posicao);
    });
  }
}
