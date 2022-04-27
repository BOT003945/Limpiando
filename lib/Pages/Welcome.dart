//import 'package:day16_shopping/Animation/FadeAnimation.dart';
//import 'package:day16_shopping/Pages/home_page.dart';
//import 'package:flutter_application_1/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:flutter_application_1/Pages/Registrar.dart';

class WelcomePage extends StatefulWidget {
  //static String get routeName => '@routes/welcome-page';
  WelcomePage({Key? key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  //static String get routeName => '@routes/home-page';
  // AnimationController scaleController;

  bool hide = false;

  @override
  void initState() {
    super.initState();
    // scaleController =
    //  AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Fondo1.jpg'),
                //  image: AssetImage('assets/images/Fondo1.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Limpiando Juntos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "La Basura Que Usted Tira En La Calle, No Habla Pero Dice Mucho De Usted ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Es Momento de hacer algo: Bienvenido al Gran Cambio ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange[900],
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 12, 12, 12),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: FlatButton(
                    child: Text(
                      "Registrarse",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 247)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegistroPage()));
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
