import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:student_location/domain/adress.dart';

class CEPAdress {

  final String baseUrl = "viacep.com.br";

  Future<dynamic>getAdress({required int cep}) async {

    Uri url = Uri.http(baseUrl, "/ws/$cep/json/");
    Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    var json = jsonDecode(response.body);

    return json;
  }
}