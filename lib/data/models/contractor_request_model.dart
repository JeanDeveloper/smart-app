import 'dart:convert';

import 'package:smart/domain/entities/contractor_request.dart';

List<ContractorRequestModel> contractorRequestModelFromJson(String str) => List<ContractorRequestModel>.from(json.decode(str).map((x) => ContractorRequestModel.fromJson(x)));

String contractorRequestModelToJson(List<ContractorRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContractorRequestModel extends ContractorRequest {
  ContractorRequestModel({
    required this.cabecera,
    required this.cantPers,
    required this.codCliente,
    required this.codeEncrypt,
    required this.ingreso,
    required this.sede,
    required this.subsede,
    required this.ambito,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
    required this.estadoReal,
    required this.nombre,
  }) : super(cabecera: cabecera, cantPers: cantPers, codCliente: codCliente, codeEncrypt: codeEncrypt, ingreso: ingreso, sede: sede, subsede: subsede, 
    ambito: ambito, fechaInicio: fechaInicio, fechaFin: fechaFin, estado: estado, estadoReal: estadoReal, nombre: nombre);

  @override
  int cabecera;
  @override
  int cantPers;
  @override
  String codCliente;
  @override
  String? codeEncrypt;
  @override
  String ingreso;
  @override
  String sede;
  @override
  String subsede;
  @override
  String ambito;
  @override
  DateTime fechaInicio;
  @override
  DateTime fechaFin;
  @override
  int estado;
  @override
  int estadoReal;
  @override
  String nombre;

  factory ContractorRequestModel.fromJson(Map<String, dynamic> json) => ContractorRequestModel(
    cabecera: json["cabecera"],
    cantPers: json["cant_pers"],
    codCliente: json["codCliente"],
    codeEncrypt: json["codeEncrypt"] ?? '', 
    ingreso: json["ingreso"],
    sede: json["sede"],
    subsede: json["subsede"],
    ambito: json["ambito"],
    fechaInicio: DateTime.parse(json["fecha_inicio"]),
    fechaFin: DateTime.parse(json["fecha_fin"]),
    estado: json["estado"],
    estadoReal: json["estadoReal"],
    nombre: json["nombre"],
  );

  Map<String, dynamic> toJson() => {
    "cabecera": cabecera,
    "cant_pers": cantPers,
    "codCliente": codCliente,
    "codeEncrypt": codeEncrypt,
    "ingreso": ingreso,
    "sede": sede,
    "subsede": subsede,
    "ambito": ambito,
    "fecha_inicio": fechaInicio.toIso8601String(),
    "fecha_fin": fechaFin.toIso8601String(),
    "estado": estado,
    "estadoReal": estadoReal,
    "nombre": nombre,
  };
}
