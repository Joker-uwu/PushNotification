import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CUERPO
      appBar: AppBar(
        title: Text('HOME'), //Titulo del Home
        centerTitle: true, //Titulo centrado
        foregroundColor: Colors.amber, //Color Titulo
        backgroundColor: Colors.purple[300], //Color del ToolBar
        elevation: 0, //Elevacion 0
      ),
      backgroundColor: Colors.greenAccent, //Color de todo el contenido
      body: Center(
        //CUERPO
        child: Text('HomePage'), //TEXT CUERPO
      ), //
    );
  }
}
