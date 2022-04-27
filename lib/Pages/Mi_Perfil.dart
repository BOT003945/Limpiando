import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Perfil.dart';
import 'package:flutter_application_1/Pages/tabs2.dart';

class Mi_PerfilPage extends StatefulWidget {
  Mi_PerfilPage({Key? key}) : super(key: key);

  @override
  _Mi_PerfilPageState createState() => _Mi_PerfilPageState();
}

class _Mi_PerfilPageState extends State<Mi_PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 251, 250),
      appBar: AppBar(
        title: Text("Mis Reportes"),
        backgroundColor: Color.fromARGB(255, 255, 103, 2),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 70),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.orange[900], borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Tabs2Page()));
          },
        ),
      ),
    );
  }
}
