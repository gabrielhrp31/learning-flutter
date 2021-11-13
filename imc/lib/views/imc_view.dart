// TODO Implement this library.// TODO Implement this library.import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:imc/widgets/button.dart';
import 'package:imc/widgets/input.dart';
import 'package:imc/widgets/screen_wrapper.dart';
import 'dart:math';

class ImcView extends StatefulWidget {
  const ImcView({Key? key}) : super(key: key);

  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<ImcView> {

  final _formKey = GlobalKey<FormBuilderState>();

  double _imc = 0.0;
  String resultado = "";

  _calcular(){
    setState((){
      _formKey.currentState!.save();
      if (_formKey.currentState != null) {
        double peso = double.parse(_formKey.currentState?.fields['peso']!.value.replaceAll(".","").replaceAll(",", "."));
        double altura = double.parse(_formKey.currentState?.fields['altura']!.value.replaceAll(".","").replaceAll(",", "."));
        if(peso>0 && altura>0){
          _imc = peso/(pow(altura, 2));
          if(_imc<18.5){
            resultado = "Baixo Peso";
          } else if(_imc>=18.5 && _imc<25){
            resultado = "Peso Saudavel";
          } else if(_imc>=25 && _imc<30){
            resultado = "SobrePeso";
          } else if(_imc>=30){
            resultado = "Obesidade";
          }
        }else{
          resultado = "Peso ou Altura Inválido!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("IMC")),
        ),
        body:FormBuilder(
            key:_formKey,
            child: ScreenWrapper(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/imc_logo.png", width: 90.0, height: 90.0, color: Theme.of(context).primaryColor,),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Input(
                        "idade",
                        labelText: "Idade",
                        keyboardType:  const TextInputType.numberWithOptions(
                          decimal: false,
                          signed: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Input(
                        "altura",
                        labelText: "Altura",
                        keyboardType:  const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Input(
                        "peso",
                        labelText: "Peso",
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                          "Calcular",
                          _calcular
                      )
                    ],
                  ),
                  Center(
                    child:
                      Text("$resultado")
                    ,
                  )
                ],
              ),
            )
        )
    );
  }
}
