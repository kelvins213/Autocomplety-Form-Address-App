import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentLocation extends StatefulWidget{
  const StudentLocation({Key? key}) : super(key:key);
  @override
  _StudentLocation createState() => _StudentLocation();
}

class _StudentLocation extends State<StudentLocation>{
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
      body: Padding(
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

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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