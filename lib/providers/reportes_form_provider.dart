import 'package:flutter/material.dart';

import '../Models/reportes.dart';

class ReporteFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Reporte reporte;

  ReporteFormProvider(this.reporte);

  bool isValidForm() {
    print(reporte.colonia);
    print(reporte.descripcin);
    print(reporte.fecha);
    print(reporte.motivo);

    return formKey.currentState?.validate() ?? false;
  }
}
