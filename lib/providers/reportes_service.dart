import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/reportes.dart';

class ReporteService extends ChangeNotifier {
  final String _baseUrl = 'reportes-c7134-default-rtdb.firebaseio.com';

  final List<Reporte> reporte = [];
  bool isLoading = true;
  bool isSaving = false;
  File? newPictureFile;
  late Reporte selectedReporte;
  bool isDeleting = false;

  ReporteService() {
    this.loadReportes();
  }

  Future<List<Reporte>> loadReportes() async {
    this.isLoading = true;

    notifyListeners();

    final url = Uri.https(_baseUrl, 'reportes.json');
    final resp = await http.get(url);

    final Map<String, dynamic> reportesMap = json.decode(resp.body);

    reportesMap.forEach((key, value) {
      final tempReporte = Reporte.fromMap(value);
      tempReporte.id = key;
      this.reporte.add(tempReporte);
    });

    this.isLoading = false;

    notifyListeners();

    return this.reporte;
  }

  Future saveOrCreateReporte(Reporte reporte) async {
    isSaving = true;
    notifyListeners();

    if (reporte.id == null) {
      await this.createReporte(reporte);
    } else {
      await this.updateReporte(reporte);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateReporte(Reporte reporte) async {
    final url = Uri.https(_baseUrl, 'reportes/${reporte.id}.json');
    final resp = await http.put(url, body: reporte.toJson());
    final decodedData = resp.body;

    final index =
        this.reporte.indexWhere((element) => element.id == reporte.id);
    this.reporte[index] = reporte;

    return reporte.id!;
  }

  Future<String> createReporte(Reporte reporte) async {
    final url = Uri.https(_baseUrl, 'reportes.json');
    final resp = await http.post(url, body: reporte.toJson());
    final decodedData = json.decode(resp.body);

    reporte.id = decodedData['name'];

    this.reporte.add(reporte);

    return reporte.id!;
  }

  void updateSelectedProductImage(String path) {
    this.selectedReporte.picture = path;

    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dtfknt03k/image/upload?upload_preset=hen9lowa');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
