import 'package:firebase_database/firebase_database.dart';

class Comunidade{
  late String key;
  late String assunto;
  late String mensagem;

  Comunidade(this.assunto, this.mensagem);

  Comunidade.fromSnapshot(DataSnapshot snapshot){
    dynamic dados = snapshot.value;
    key = snapshot.key!;
    assunto = dados['assunto']!;
    mensagem = dados['mensagem']!;
  }

  toJson(){
    return {
      "assunto" : assunto,
      "mensagem" : mensagem
    };
  }
}
