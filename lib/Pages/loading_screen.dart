import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Mis Reportes', style: TextStyle(color: Colors.black)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.orangeAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
      body: Center(
        child: CircularProgressIndicator(color: Colors.orangeAccent),
      ),
    );
  }
}
