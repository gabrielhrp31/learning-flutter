import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;

Map _dados = {};
List _terremotos = [];

void  main() async {
  _dados = await carregarTerremotos();
  _terremotos =_dados['features'];
  runApp(const MaterialApp(
    home:Terremotos()
  ));
}

//

class Terremotos extends StatelessWidget {
  const Terremotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terremotos"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body:Center(
        child: ListView.builder(
            itemCount: _terremotos.length,
            padding: const EdgeInsets.all(15.5),
            itemBuilder: (context, posicao){
              var props = _terremotos[posicao]['properties'];
              String mag = props['mag'].toStringAsFixed(2);
              initializeDateFormatting('de_DE', null);
              var format = DateFormat.yMMMMd("pt_BR");
              String data = format.format(DateTime.fromMicrosecondsSinceEpoch(props['time']*1000));
              return Column(
                children: [
                  const Divider(height: 5.5,),
                  ListTile(
                    title:Text(
                        data,
                        style:const TextStyle(
                            fontSize:14.5,
                            fontWeight: FontWeight.bold,
                            color:Colors.red,
                            fontStyle: FontStyle.normal
                        )
                    ),
                    subtitle: Text(
                      "${props['place']}",
                      style:const TextStyle(
                        fontSize:14.5,
                        fontWeight: FontWeight.normal,
                        color:Colors.grey,
                        fontStyle: FontStyle.italic
                      )
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Text(
                          mag,
                        style:const TextStyle(
                          fontSize:14.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.normal
                        )
                      ),
                    ),
                    onTap: (){
                      mostrarMensagem(context,props['title']);
                    },
                ),
              ]);
            }
        ),
      )
    );
  }

  void mostrarMensagem(BuildContext context, String mensagem) {
    var alert = AlertDialog(
      title: const Text("Terremotos"),
      content: Text(mensagem),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: ()=>Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, builder: (_){
      return alert;
    });
  }
}

Future<Map> carregarTerremotos() async{
  Uri url = Uri.parse("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson");
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

