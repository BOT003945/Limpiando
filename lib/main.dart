import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Splashscreen.dart';
import 'package:flutter_application_1/providers/reportes_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReporteService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //backgroundColor: Color.fromARGB(245,68,67,65),
        primaryColor: Color.fromRGBO(15, 15, 15, 0.961),
        accentColor: Color.fromARGB(255, 255, 238, 2),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      // initialRoute: TabsPage.ROUTE,
      //routes: {
      //'tabs': (BuildContext context) => TabsPage(),
      //TabsPage.ROUTE: (_) => TabsPage(),
      //}
    );
  }
}
