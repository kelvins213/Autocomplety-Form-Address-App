import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:student_location/data/location_api.dart';

class StudentLocation extends StatefulWidget{
  const StudentLocation({Key? key}) : super(key:key);
  @override
  _StudentLocation createState() => _StudentLocation();
}

class _StudentLocation extends State<StudentLocation>{

  Future<List<String>> countries = CountryNames().getCountriesName();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFDFD3C3),
      appBar: AppBar(
        title: buildText(text: "Cadastrar Localização", size: 24),
        backgroundColor: const Color(0xFF3C2A21),
        centerTitle: true,
      ),
      //vai precisar cercar com Futurebuilder()
      body: FutureBuilder<List<String>>(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List dropDownItems = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  Card(
                    color: const Color(0xFF3C2A21),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(12.0),
                      child: Container(
                        height: 400,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TypeAheadFormField(
                                  textFieldConfiguration: TextFieldConfiguration(
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      hintText: "País",
                                    ),
                                  ),
                                    itemBuilder: (context, sugestion) {
                                      return ListTile(

                                      );
                                    },
                                    suggestionsCallback: (pattern) async {
                                      return await BackendService.getSuggestions(pattern);
                                      //implementar a classe BackendService
                                    }
                                    onSuggestionSelected: (suggestion) {
                                      
                                    },
                                ),
                              ],
                            ),
                          ],
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
}

