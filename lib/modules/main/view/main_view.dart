import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla MAIN"),
      ),
      body: Builder(
        builder: (BuildContext localContext) {
          return Container();
        },
      ),
    );
  }
}
