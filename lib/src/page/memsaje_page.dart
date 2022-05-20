import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      //all EL CONTENIDO
      appBar: AppBar(
        title: Text('MENSAJE!'),
        centerTitle: true, //Titulo centrado
        elevation: 0, //Elevacion 0
      ),
      backgroundColor: Color.fromARGB(255, 136, 180, 255),
      body: Center(
        //CUERPO
        child: Text(arg.toString()), //TEXTO DEL CUERPO
      ), //
    );
  }
}
