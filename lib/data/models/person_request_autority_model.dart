import 'dart:convert';

import 'package:smart/domain/entities/person_request_autority.dart';

List<PersonRequestAutorityModel> personRequestAutorityModelFromJson(String str) => List<PersonRequestAutorityModel>.from(json.decode(str).map((x) => PersonRequestAutorityModel.fromJson(x)));

String personRequestAutorityModelToJson(List<PersonRequestAutorityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonRequestAutorityModel extends PersonRequestAutority{
    PersonRequestAutorityModel({
        required this.fullname,
        required this.nroDoc,
        required this.ruc,
        required this.fechaIniPer,
        required this.fechaFinPer,
        required this.aprobado,
        required this.induccion,
        required this.autorizado,
        required this.estadoTotal,
        required this.codDetPersona,
        required this.fecha,
    }) : super(
      fullname: fullname, nroDoc: nroDoc, ruc: ruc, fechaIniPer: fechaIniPer, fechaFinPer: fechaFinPer, aprobado: aprobado, 
      induccion: induccion, autorizado: autorizado, estadoTotal: estadoTotal, codDetPersona: codDetPersona, fecha: fecha);

    String fullname;
    String nroDoc;
    String ruc;
    DateTime fechaIniPer;
    DateTime fechaFinPer;
    int aprobado;
    bool induccion;
    int autorizado;
    int estadoTotal;
    int codDetPersona;
    String fecha;

    factory PersonRequestAutorityModel.fromJson(Map<String, dynamic> json) => PersonRequestAutorityModel(
        fullname: json["fullname"],
        nroDoc: json["nroDoc"],
        ruc: json["ruc"],
        fechaIniPer: DateTime.parse(json["fecha_ini_per"]),
        fechaFinPer: DateTime.parse(json["fecha_fin_per"]),
        aprobado: json["aprobado"],
        induccion: json["induccion"],
        autorizado: json["autorizado"],
        estadoTotal: json["estadoTotal"],
        codDetPersona: json["codDetPersona"],
        fecha: json["fecha"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "nroDoc": nroDoc,
        "ruc": ruc,
        "fecha_ini_per": fechaIniPer.toIso8601String(),
        "fecha_fin_per": fechaFinPer.toIso8601String(),
        "aprobado": aprobado,
        "induccion": induccion,
        "autorizado": autorizado,
        "estadoTotal": estadoTotal,
        "codDetPersona": codDetPersona,
        "fecha": fecha,
    };
}
