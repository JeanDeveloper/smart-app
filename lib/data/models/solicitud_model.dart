import 'dart:convert';

import 'package:smart/domain/entities/solicitud.dart';

List<SolicitudModel> solicitudModelFromJson(String str) => List<SolicitudModel>.from(json.decode(str).map((x) => SolicitudModel.fromJson(x)));

String solicitudModelToJson(List<SolicitudModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class SolicitudModel extends Solicitud{
  SolicitudModel({
    required this.code,
    required this.encryptCode,
    required this.customerCode,
    required this.nroPeople,
    required this.typeEntry,
    required this.campus,
    required this.subCampus,
    required this.ambit,
    required this.enterPrise,
    required this.ruc,
    required this.startDate,
    required this.endDate,
    required this.endState,
    required this.status,
  }) : super(
    code: code, 
    encryptCode: encryptCode, 
    customerCode: customerCode, 
    nroPeople: nroPeople, 
    typeEntry: typeEntry, 
    campus: campus, 
    subCampus: subCampus, 
    ambit: ambit, 
    enterPrise: enterPrise, 
    ruc: ruc, 
    startDate: startDate, 
    endDate: endDate, 
    endState: endState, 
    status: status
  );

  @override
  int      code;
  @override
  String   encryptCode;
  @override
  String   customerCode;
  @override
  int      nroPeople;
  @override
  String   typeEntry;
  @override
  String   campus;
  @override
  String   subCampus;
  @override
  String   ambit;
  @override
  String   enterPrise;
  @override
  String   ruc;
  @override
  DateTime startDate;
  @override
  DateTime endDate;
  @override
  int      endState;
  @override
  String   status;


  factory SolicitudModel.fromJson(Map<String, dynamic> json) => SolicitudModel(
    code : json["codigo"],
    encryptCode : json["codeEncrypt"],
    customerCode : json["codCliente"],
    nroPeople : json["cant_pers"],
    typeEntry : json["ingreso"],
    campus : json["sede"],
    subCampus : json["subsede"],
    ambit : json["ambito"],
    enterPrise : json["empresa"],
    ruc : json["ruc"],
    startDate : DateTime.parse(json["fecha_inicio"]),
    endDate : DateTime.parse(json["fecha_fin"]) ,
    endState : json["estado_fin"],
    status : json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "codigo": code,
    "codeEncrypt": encryptCode,
    "codCliente": customerCode,
    "cant_pers": nroPeople,
    "ingreso": typeEntry,
    "sede": campus,
    "subsede": subCampus,
    "ambito": ambit,
    "empresa": enterPrise,
    "ruc": ruc,
    "fecha_inicio": startDate,
    "fecha_fin": endDate,
    "estado_fin": endState,
    "estado": status,
  };

}