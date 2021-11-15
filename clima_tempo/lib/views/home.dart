import 'package:clima_tempo/services/busca_clima.dart';
import 'package:clima_tempo/util/util.dart';
import 'package:clima_tempo/views/pesquisar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _cidadeRecebida="";

  Future _abrirNovaTela(BuildContext context) async{
    Map resultado = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext conntext){
          return Pesquisar();
    }));
    if(resultado.containsKey("cidade")){
      debugPrint( resultado['cidade']);
      setState(() {
        _cidadeRecebida = resultado['cidade'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClimaTempo"),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              onPressed:()=> _abrirNovaTela(context),
              icon: const Icon(Icons.menu)
          )
        ],
      ),
      body:Stack(
        children: [
          Center(
            child: Image.asset(
                "assets/umbrella.png",
                width:double.infinity,
                height:double.infinity,
                fit:BoxFit.cover,
            )
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:EdgeInsets.all(20),
                  child: Text(_cidadeRecebida.isNotEmpty ?_cidadeRecebida: minhaCidade,
                    style: styleCidade()
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/light_rain.png"),
          ),
          atualizarTemWidget(_cidadeRecebida)
        ],
      )
    );
  }


  Widget atualizarTemWidget(String cidade){
    return FutureBuilder(
      future: getClima(cidade.isEmpty ? minhaCidade:cidade),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map<String, dynamic> data= snapshot.data as Map<String, dynamic>;
          debugPrint(data.toString());
          return Container(
            margin: const EdgeInsets.fromLTRB(30,250,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                      "${data['main']['temp'].toString()}C",
                      style: styleTemp(),
                  ),
                  subtitle: ListTile(
                    title: Text(
                        "${data['main']['humidity']}\n"
                        "${"Min: "+data['main']['temp_min'].toString()}\n"
                        "${"Max: "+data['main']['temp_max'].toString()}\n",
                      style: extraTemp(),

                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          return Container(
            child: Text("Falha ao buscar clima!"),
          );
        }
      }
    );
  }

  TextStyle extraTemp(){
    return const TextStyle(
        color:Colors.white70,
        fontStyle: FontStyle.normal,
        fontSize: 19
    );
  }

  TextStyle styleTemp(){
    return const TextStyle(
        color:Colors.white,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 28
    );
  }

  TextStyle styleCidade(){
    return const TextStyle(
        color:Colors.white,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 28
    );
  }
}

