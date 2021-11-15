import 'dart:convert';

import 'package:clima_tempo/util/util.dart';
import 'package:http/http.dart' as http;

Future<Map> getClima(String cidade) async {
  Uri uri = Uri.parse("https://community-open-weather-map.p.rapidapi.com/weather?q=$cidade&units=metric");
  Map<String, String> headers = {
    'x-rapidapi-host': apiHost,
    'x-rapidapi-key': appId
  };
  http.Response response = await http.get(uri,headers: headers);
  print(response);
  if(response.statusCode ==200){
    return json.decode(response.body);
  }
  throw Exception("Falhou!");
}