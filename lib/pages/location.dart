import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_location/data/adress_api.dart';
import 'package:student_location/data/location_api.dart';
import 'package:student_location/data/student_api.dart';

class StudentLocation extends StatefulWidget{
  const StudentLocation({Key? key}) : super(key:key);
  @override
  _StudentLocation createState() => _StudentLocation();
}

class _StudentLocation extends State<StudentLocation>{

  Future<List<String>> countries = CountryNames().getCountriesName();
  final _formKey = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  dynamic snackBar = SnackBar(
    backgroundColor: const Color(0xFF227C70),
    content: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your data was saved!", style: TextStyle(fontSize: 18),)
        ],
      ),
    ),
  );


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF86C8BC),
      appBar: AppBar(
        title: buildText(text: "Cadastrar Endereço", size: 24),
        backgroundColor: const Color(0xFF227C70), //D5CEA3
        centerTitle: true,
      ),
      body: FutureBuilder<List<String>>(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  Card(
                    color: const Color(0xFFCEEDC7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(12.0),
                      child: Container(
                        height: 700,
                        width: MediaQuery.of(context).size.width - 12,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //we can implement a Listview.builder here
                              buildTextFormField(controller: countryController, title: "Pais"),
                              buildTextFormField(controller: stateController, title: "Estado"),
                              buildTextFormField(controller: cepController, title: "CEP"),
                              buildTextFormField(controller: cityController, title: "Cidade"),
                              buildTextFormField(controller: neighborhoodController, title: "Bairro"),
                              buildTextFormField(controller: streetController, title: "Rua"),
                              buildTextFormField(controller: numberController, title: "Numero"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF86C8BC),
                                    ),
                                      onPressed: onPressed,
                                      child: buildText(text: "Enviar", size: 24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  buildText({required String text, required double size}){
    return Text(
       text,
       style: TextStyle(
         fontSize: size,
         fontWeight: FontWeight.bold,
       ),
    );
  }

  buildTextFormField({required TextEditingController controller, required String title}){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: title,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo sem preenchimento";
        }
      },
    );
  }

  onPressed() async {
    if (_formKey.currentState!.validate()) {
      Location().insertCountry(country: countryController.text, state: stateController.text, city: cityController.text, neighborhood: neighborhoodController.text, street: streetController.text, cep: cepController.text, number: numberController.text);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      countryController.text = ""; stateController.text = ""; cityController.text = ""; neighborhoodController.text = ""; cepController.text = ""; streetController.text = ""; numberController.text = "";
    } else {
      if (cepController.text != null) {
        var cep = int.parse(cepController.text);
        var json = await CEPAdress().getAdress(cep: cep);
        if (json['cep'] != null) {
          stateController.text = json['uf'];
          cityController.text = json['localidade'];
          neighborhoodController.text = json['bairro'];
          streetController.text = json['logradouro'];
        }
      }
    }
  }
}
