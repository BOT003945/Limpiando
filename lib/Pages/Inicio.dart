import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  //static const String ROUTE = "/Inicio";

  InicioPage({Key? key, @required this.title}) : super(key: key);

  final String? title;
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(widget.title),
          ),
    );
  }
}
