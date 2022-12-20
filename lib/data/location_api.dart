import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CountryNames{

  Future<List<dynamic>> getCountriesName() async {

    List<dynamic> countries = <dynamic>[];
    String baseUrl = "servicodados.ibge.gov.br";
    Uri url = Uri.http(baseUrl, "/api/v1/localidades/paises");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var country in json) {
        countries.add(country);
      }
    }

    for (var i = 0; i < countries.length; i++) {
      print(countries[i]['nome']); //tem todos os paises aqui
    }

    return countries;
    //Link do vídeo para encontrar a cidade pelo CEP
    //https://youtu.be/r3LcUSQVmFs

  }
}