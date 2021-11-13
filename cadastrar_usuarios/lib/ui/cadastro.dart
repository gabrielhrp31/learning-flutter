import 'package:cadastrat_usuarios/widgets/button.dart';
import 'package:cadastrat_usuarios/widgets/input.dart';
import 'package:cadastrat_usuarios/widgets/screen_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  final _formKey = GlobalKey<FormBuilderState>();
  bool ok = false;

  _cancelar(){
    _formKey.currentState?.reset();
  }

  _login(){
    _formKey.currentState?.save();
    setState(() {
      if(_formKey.currentState!.fields['nome']!.value.toString().trim().isNotEmpty
      && _formKey.currentState!.fields['senha']!.value.toString().trim().isNotEmpty){
        setState(() {
          ok = true;
        });
      }else{
          ok = false;
      }
    });
    print(_formKey.currentState?.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Cadastro"),
        ),
      ),
      body: FormBuilder(
        key:_formKey,
        child: ScreenWrapper(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children:[
                Image.asset("assets/face.png", width: 90.0, height: 90.0, color: Theme.of(context).primaryColor,),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Input(
                      "nome",
                      labelText: "Nome",
                    ),
                    const SizedBox(height: 20),
                    Input(
                      "senha",
                      labelText: "Senha",
                      obscureText: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button("Entrar", _login),
                    const SizedBox(height: 20),
                    Button("Cancelar", _cancelar)
                  ]
                ),
                Center(
                    child: Text(
                        ok?"Bem Vindo ${_formKey.currentState?.value['nome']}":"",
                        style: Theme.of(context).textTheme.headline1,
                    )
                )
              ]
          ),
        ),
      )
    );
  }
}
