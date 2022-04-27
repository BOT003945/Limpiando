//import 'dart:html';
//import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Inicio.dart';
import 'package:flutter_application_1/Pages/Perfil.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Pages/reportehome_screen.dart';

//import 'package:c'
//
class TabsPage extends StatefulWidget {
  static const String ROUTE = "/Tabs";

  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int pageindex = 0;

  final InicioPage _listInicio = InicioPage();
  final PerfilPage _listPerfil = new PerfilPage();

  Widget _showPage = new InicioPage();
  Widget _pageChooser(int page) {
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

  /*PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        //title: Text("Limpiando Juntos"),
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _index = index);
        },
        children: [
          InicioPage(),
          ReportePage(),
          PerfilPage(),
        ],
      ),*/

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

        /* onTap: (index) {
          setState(() => _index = index);
          _controller?.animateToPage(
            _index,
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        },
        currentIndex: _index,
        backgroundColor: Color.fromARGB(255, 255, 103, 2),
        // backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Color.fromRGBO(183, 188, 201, 1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Users")
        ],*/
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          )),
    );
  }
}
