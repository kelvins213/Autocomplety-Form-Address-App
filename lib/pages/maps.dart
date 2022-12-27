import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddres extends StatefulWidget{
  const MapAddres({Key? key}) : super(key:key);
  @override
  _MapAddres createState() => _MapAddres();

}

class _MapAddres extends State<MapAddres>{

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(37.773972, -122.431297),
      zoom: 11.5,
  );


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: buildText(text: "Localização", size: 24),
        backgroundColor: const Color(0xFF227C70),
        centerTitle: true,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
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
