import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Inicio.dart';
import 'package:flutter_application_1/Pages/Perfil.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Pages/reportehome_screen.dart';

//import 'package:c'
//
class Tabs2Page extends StatefulWidget {
  static const String ROUTE = "/Tabs";

  Tabs2Page({Key? key}) : super(key: key);

  @override
  _Tabs2PageState createState() => _Tabs2PageState();
}

class _Tabs2PageState extends State<Tabs2Page> {
  int pageindex = 0;

  final InicioPage _listInicio = InicioPage();
  final PerfilPage _listPerfil = new PerfilPage();

  Widget _showPage = new PerfilPage();
  int page = 2;
  Widget _pageChooser(page) {
    switch (page) {
      case 0:
        return _listPerfil;
        break;
      case 1:
        return ReporteHome();
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'No page found by page chooser',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Color.fromARGB(255, 252, 103, 4),
        buttonBackgroundColor: Color.fromARGB(255, 252, 103, 4),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          )),
    );
  }
}
