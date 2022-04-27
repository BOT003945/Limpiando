// To parse this JSON data, do
//
//     final usuarios = usuariosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Usuarios> usuariosFromJson(String str) =>
    List<Usuarios>.from(json.decode(str).map((x) => Usuarios.fromJson(x)));

String usuariosToJson(List<Usuarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuarios {
  Usuarios({
    required this.idUsuario,
    required this.nombres,
    required this.apellidoP,
    required this.apellidoM,
    required this.email,
    required this.clave,
    required this.reportes,
  });

  final int idUsuario;
  final String nombres;
  final String apellidoP;
  final String apellidoM;
  final String email;
  final String clave;
  final List<dynamic> reportes;

  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        idUsuario: json["idUsuario"],
        nombres: json["nombres"],
        apellidoP: json["apellidoP"],
        apellidoM: json["apellidoM"],
        email: json["email"],
        clave: json["clave"],
        reportes: List<dynamic>.from(json["reportes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "nombres": nombres,
        "apellidoP": apellidoP,
        "apellidoM": apellidoM,
        "email": email,
        "clave": clave,
        "reportes": List<dynamic>.from(reportes.map((x) => x)),
      };
}
