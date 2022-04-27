import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Inicio.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:flutter_application_1/Pages/Welcome.dart';

class SplashScreen extends StatefulWidget {
  //SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(
      Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (contex) => WelcomePage(
              // title: 'Limpiando Juntos',
              ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 101, 2),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Image.asset('assets/images/kawaibag.png'),
            Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: .6,
                //child: Image.asset('assets/images/kawaibag.png'),
                //  child: FlutterLogo(size: 400),
              ),
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
            Text('Bienvenido')
          ],
        ),
      ),
    );
  }
}
