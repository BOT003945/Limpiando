import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/reporte_image.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../Animation/input_decorations.dart';
import '../providers/reportes_form_provider.dart';
import '../providers/reportes_service.dart';

class ReporteScreenedit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reporteService = Provider.of<ReporteService>(context);

    return ChangeNotifierProvider(
      create: (_) => ReporteFormProvider(reporteService.selectedReporte),
      child: _ServicesScreenBody(reporteService: reporteService),
    );
  }
}

class _ServicesScreenBody extends StatelessWidget {
  const _ServicesScreenBody({
    Key? key,
    required this.reporteService,
  }) : super(key: key);

  final ReporteService reporteService;

  @override
  Widget build(BuildContext context) {
    final reporteForm = Provider.of<ReporteFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ReporteImage(url: reporteService.selectedReporte.picture),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_ios_new,
                          size: 40, color: Colors.white),
                    )),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: () async {
                        final picker = new ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.gallery, imageQuality: 100);
                        if (pickedFile == null) {
                          print('No selecciono una imagén');
                          return;
                        }
                        reporteService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      icon: Icon(Icons.camera_alt_outlined,
                          size: 40, color: Colors.white),
                    )),
              ],
            ),
            _ServicioForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: reporteService.isSaving
            ? CircularProgressIndicator(color: Colors.white)
            : Icon(
                Icons.save_outlined,
              ),
        backgroundColor: Colors.yellow,
        onPressed: reporteService.isSaving
            ? null
            : () async {
                final String? imageUlr = await reporteService.uploadImage();

                if (imageUlr != null) reporteForm.reporte.picture = imageUlr;
                await reporteService.saveOrCreateReporte(reporteForm.reporte);
              },
      ),
    );
  }
}

class _ServicioForm extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    final reporteForm = Provider.of<ReporteFormProvider>(context);
    final reporte = reporteForm.reporte;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: reporteForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: reporte.motivo,
                style: TextStyle(color: Colors.black),
                onChanged: (value) => reporte.motivo = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El motivo es obligatoio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Antihigiénico',
                  labelText: 'Motivo Denuncia',
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: reporte.descripcin,
                style: TextStyle(color: Colors.black),
                onChanged: (value) => reporte.descripcin = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La descripción es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'El gobierno no se hace cargo de la basura',
                    labelText: 'Descripción'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: reporte.colonia,
                style: TextStyle(color: Colors.black),
                onChanged: (value) => reporte.colonia = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La Colonia es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Centro', labelText: 'Colonia'),
              ),
              SizedBox(height: 30),
              DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      fieldHintText: '2022-10-10',
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: '2022-10-10', labelText: 'Fecha del Reporte'),
                initialValue: reporte.fecha,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        border: Border.all(
          color: Colors.indigo,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5)
        ],
      );

/*   setState(String Function() param0) {}
} */
}
