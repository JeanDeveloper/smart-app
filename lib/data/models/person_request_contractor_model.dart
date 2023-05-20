import 'dart:convert';

import 'package:smart/domain/entities/person_request_contractor.dart';

List<PersonRequestContractorModel> personRequestContractorModelFromJson(String str) => List<PersonRequestContractorModel>.from(json.decode(str).map((x) => PersonRequestContractorModel.fromJson(x)));

String personRequestContractorModelToJson(List<PersonRequestContractorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonRequestContractorModel extends PersonRequestContractor {
  @override
  String fullname;
  @override
  String nroDoc;
  @override
  String cargo;
  @override
  String area;
  @override
  String motivo;
  @override
  String tipotrabajo;
  @override
  DateTime fechaIniPer;
  @override
  DateTime fechaFinPer;
  @override
  int codDetPersona;
  @override
  int cumple;
  @override
  int noCumple;
  @override
  int porcentaje;
  @override
  int hayObs;
  @override
  int aprobado;
  @override
  bool tieneQr;
  @override
  int autorizado;
  @override
  int estadoBloqueado;

  PersonRequestContractorModel({
    required this.fullname,
    required this.nroDoc,
    required this.cargo,
    required this.area,
    required this.motivo,
    required this.tipotrabajo,
    required this.fechaIniPer,
    required this.fechaFinPer,
    required this.codDetPersona,
    required this.cumple,
    required this.noCumple,
    required this.porcentaje,
    required this.hayObs,
    required this.aprobado,
    required this.tieneQr,
    required this.autorizado,
    required this.estadoBloqueado,
  }) : super(
    fullname: fullname, 
    nroDoc: nroDoc, 
    cargo: cargo, 
    area: area, 
    motivo: motivo, 
    tipotrabajo: tipotrabajo, 
    fechaIniPer: fechaIniPer, 
    fechaFinPer: fechaFinPer, 
    codDetPersona: codDetPersona, 
    cumple: cumple, 
    noCumple: noCumple, 
    porcentaje: porcentaje, 
    hayObs: hayObs, 
    aprobado: aprobado, 
    tieneQr: tieneQr, 
    autorizado: autorizado, 
    estadoBloqueado: estadoBloqueado
  );

  factory PersonRequestContractorModel.fromJson(Map<String, dynamic> json) => PersonRequestContractorModel(
    fullname: json["fullname"],
    nroDoc: json["nroDoc"],
    cargo: json["cargo"],
    area: json["area"],
    motivo: json["motivo"],
    tipotrabajo: json["tipotrabajo"],
    fechaIniPer: DateTime.parse(json["fecha_ini_per"]),
    fechaFinPer: DateTime.parse(json["fecha_fin_per"]),
    codDetPersona: json["codDetPersona"],
    cumple: json["cumple"],
    noCumple: json["no_cumple"],
    porcentaje: json["porcentaje"],
    hayObs: json["hay_obs"],
    aprobado: json["aprobado"],
    tieneQr: json["tieneQR"],
    autorizado: json["autorizado"],
    estadoBloqueado: json["estadoBloqueado"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "nroDoc": nroDoc,
    "cargo": cargo,
    "area": area,
    "motivo": motivo,
    "tipotrabajo": tipotrabajo,
    "fecha_ini_per": fechaIniPer.toIso8601String(),
    "fecha_fin_per": fechaFinPer.toIso8601String(),
    "codDetPersona": codDetPersona,
    "cumple": cumple,
    "no_cumple": noCumple,
    "porcentaje": porcentaje,
    "hay_obs": hayObs,
    "aprobado": aprobado,
    "tieneQR": tieneQr,
    "autorizado": autorizado,
    "estadoBloqueado": estadoBloqueado,
  };
}
