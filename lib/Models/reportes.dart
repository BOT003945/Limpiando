import 'dart:convert';

class Reporte {
  Reporte({
    required this.colonia,
    required this.descripcin,
    required this.fecha,
    required this.motivo,
    this.picture,
    this.id,
  });

  String colonia;
  String descripcin;
  DateTime fecha;
  String motivo;
  String? picture;
  String? id;

  factory Reporte.fromJson(String str) => Reporte.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reporte.fromMap(Map<String, dynamic> json) => Reporte(
      colonia: json["Colonia"],
      descripcin: json["Descripcin"],
      fecha: DateTime.parse(json["Fecha"]),
      motivo: json["Motivo"],
      picture: json["picture"]);

  Map<String, dynamic> toMap() => {
        "Colonia": colonia,
        "Descripcin": descripcin,
        "Fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "Motivo": motivo,
        "picture": picture,
      };

  Reporte copy() => Reporte(
        colonia: this.colonia,
        descripcin: this.descripcin,
        fecha: this.fecha,
        motivo: this.motivo,
        id: this.id,
        picture: this.picture,
      );
}
