import 'dart:convert';
import 'package:smart/domain/entities/person_request.dart';

List<PersonRequestModel> personRequestModelFromJson(String str) => List<PersonRequestModel>.from(json.decode(str).map((x) => PersonRequestModel.fromJson(x)));

class PersonRequestModel extends PersonRequest{
  PersonRequestModel({
    this.fullname,
    this.nroDoc,
    this.cargo,
    this.area,
    this.motivo,
    this.tipotrabajo,
    this.fechaIniPer,
    this.fechaFinPer,
    this.codDetPersona,
    this.cumple,
    this.completado,
    this.noCumple,
    this.porcentaje,
    this.hayObs,
    this.aprobado,
    this.tieneQr,
    this.autorizado,
    this.permisoAprobacion,
    this.estadoBloqueado,
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
    completado: completado, 
    noCumple: noCumple, 
    porcentaje: porcentaje, 
    hayObs: hayObs, 
    aprobado: aprobado, 
    tieneQr: tieneQr, 
    autorizado: autorizado, 
    permisoAprobacion: permisoAprobacion, 
    estadoBloqueado: estadoBloqueado
  );

  @override
  String? fullname;
  @override
  String? nroDoc;
  @override
  String? cargo;
  @override
  String? area;
  @override
  String? motivo;
  @override
  String? tipotrabajo;
  @override
  DateTime? fechaIniPer;
  @override
  DateTime? fechaFinPer;
  @override
  int? codDetPersona;
  @override
  int? cumple;
  @override
  bool? completado;
  @override
  int? noCumple;
  @override
  int? porcentaje;
  @override
  int? hayObs;
  @override
  int? aprobado;
  @override
  bool? tieneQr;
  @override
  bool? autorizado;
  @override
  bool? permisoAprobacion;
  @override
  int? estadoBloqueado;

  factory PersonRequestModel.fromJson(Map<String, dynamic> json) => PersonRequestModel(
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
    completado: json["completado"],
    noCumple: json["no_cumple"],
    porcentaje: json["porcentaje"],
    hayObs: json["hay_obs"],
    aprobado: json["aprobado"],
    tieneQr: json["tieneQR"],
    autorizado: json["autorizado"],
    permisoAprobacion: json["permisoAprobacion"],
    estadoBloqueado: json["estadoBloqueado"],
  );

}
