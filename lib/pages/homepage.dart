import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Hola UwU"),
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            backgroundColor: Color.fromARGB(255, 25, 238, 18)),
        body: Center(
          child: Text("Home Page"),
        ));
  }
}
