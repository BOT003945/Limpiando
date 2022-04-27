import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/loading_screen.dart';
import 'package:flutter_application_1/Pages/reporte_screen.dart';

import 'package:provider/provider.dart';

import '../Models/reportes.dart';
import '../Widgets/reporte_card.dart';
import '../providers/reportes_service.dart';

class ReporteHome extends StatelessWidget {
  const ReporteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reporteService = Provider.of<ReporteService>(context);

    if (reporteService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Mis Reportes', style: TextStyle(color: Colors.black)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.orangeAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
      body: ListView.builder(
          itemCount: reporteService.reporte.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
/*                   reporteService.selectedReporte =
                      reporteService.reporte[index].copy();
                  Navigator.pushNamed(context, 'reporteedit'); */
                },
                child: ReporteCard(
                  reporte: reporteService.reporte[index],
                ),
              )),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          reporteService.selectedReporte = new Reporte(
              colonia: '', descripcin: '', fecha: DateTime.now(), motivo: '');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReporteScreenedit()),
          );
        },
      ),
    );
  }
}
