import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:planeta_x/widgets/button.dart';
import 'package:planeta_x/widgets/input.dart';
import 'package:planeta_x/widgets/screen_wrapper.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormBuilderState>();
  double _peso = 0.0;
  String _planeta = "";

  _calcularPesoPlaneta(String peso,double gravity){
    if(peso.toString().isNotEmpty && double.tryParse(peso)!=null){
      return double.parse(peso)*gravity;
    }
    return 0.0;
  }

  _calcula(){
    setState((){
      if (_formKey.currentState != null) {
        _formKey.currentState!.save();
        switch (_formKey.currentState?.fields['planeta']?.value) {
          case 'V':
            _planeta = "Vênus";
            _peso = _calcularPesoPlaneta(_formKey.currentState?.fields['peso']?.value, 0.91);
            break;
          case 'P':
            _planeta = "Plutão";
            _peso = _calcularPesoPlaneta(_formKey.currentState?.fields['peso']?.value,  0.06);
            break;
          case 'M':
            _planeta = "Marte";
            _peso = _calcularPesoPlaneta(_formKey.currentState?.fields['peso']?.value, 0.38);
            break;
          default:
            _peso=0.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Planeta X"),
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ScreenWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/planeta.png',width: 90,height: 90,color: Theme.of(context).primaryColor),
                Flex(
                  direction: Axis.vertical,
                  children:[
                    Input(
                        "peso",
                        labelText:"Seu peso na terra",
                      keyboardType:TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    FormBuilderRadioGroup(
                      name: "planeta",
                      initialValue: "M",
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder:InputBorder.none,
                      ),
                      wrapAlignment: WrapAlignment.center,
                      activeColor: Theme.of(context).primaryColor,
                      options: [
                        FormBuilderFieldOption(
                          value: "P",
                          child: Text("Plutão",style:Theme.of(context).textTheme.caption),
                        ),
                        FormBuilderFieldOption(
                          value: "M",
                          child: Text("Marte",style:Theme.of(context).textTheme.caption),
                        ),
                        FormBuilderFieldOption(
                          value: "V",
                          child: Text("Vênus",style:Theme.of(context).textTheme.caption),
                        )
                      ]
                    )
                  ] ,
                ),
                Row(
                  children: [
                    Button(
                      "Calcular",
                      _calcula
                    )
                  ],
                ),
                Center(
                  child: Text(
                      _planeta.isNotEmpty?"Seu peso em $_planeta é ${_peso.toStringAsFixed(2)}":"",
                      style:Theme.of(context).textTheme.headline1
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
