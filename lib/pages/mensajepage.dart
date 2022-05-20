import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  const MensajePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
            title: Text("vandeja de entrada"),
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            backgroundColor: Color.fromARGB(255, 25, 238, 18)),
        body: Center(
          child: Text(arg),
        ));
  }
}
