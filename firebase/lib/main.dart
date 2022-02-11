import 'package:firebase/models/comunidade.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Usando firebase na web, ios e android
  //https://stackoverflow.com/questions/70232931/firebaseoptions-cannot-be-null-when-creating-the-default-app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final FirebaseDatabase database = FirebaseDatabase.instance;
  late Comunidade comunidade;
  late DatabaseReference databaseReference;
  late List<Comunidade> comunidades;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    comunidade = Comunidade("", "");
    databaseReference = database.ref().child("comunidade");
    comunidades = [];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
              "Comunidade",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.subject),
                        title: TextFormField(
                          initialValue: "",
                          onSaved: (val)=>comunidade.assunto=val ?? "",
                          validator: (val) =>val!.trim().isEmpty?"Campo obrigatorio":null,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.message),
                        title: TextFormField(
                          initialValue: "",
                          onSaved: (val)=>comunidade.mensagem=val ?? "",
                          validator: (val) =>val!.trim().isEmpty?"Campo obrigatorio":null,
                        ),
                      ),
                      TextButton(
                          onPressed: ()=>_enviarMensagem(),
                          child: const Text("Enviar"),
                          style: TextButton.styleFrom(
                            primary: Colors.pink,
                          ),
                      )
                    ],
                  ),
                ),
              ),
              flex: 0,
            ),
            Flexible(
                child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, dataSnapshot, Animation<double> animation, int posicao){
                    dynamic dados = dataSnapshot.value;
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.redAccent,
                        ),
                        title: Text(dados['assunto']),
                        subtitle: Text(dados['mensagem']),
                      ),
                    );
                  },
                )
            )
          ],
      ),
    );
  }

  _enviarMensagem() {
    final FormState? formState = formKey.currentState;
    if(formState!=null && formState.validate()){
      formState.save();
      databaseReference.push().set(comunidade.toJson());
      formState.reset();
    }
  }
}
