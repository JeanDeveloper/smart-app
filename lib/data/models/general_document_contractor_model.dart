import 'dart:convert';

import 'package:smart/domain/entities/general_document_contractor.dart';

List<GeneralDocumentContractorModel> generalDocumentContractorModelFromJson(String str) => List<GeneralDocumentContractorModel>.from(json.decode(str).map((x) => GeneralDocumentContractorModel.fromJson(x)));

String generalDocumentContractorModelToJson(List<GeneralDocumentContractorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeneralDocumentContractorModel extends GeneralDocumentContractor {
  @override
  int codigo;
  @override
  String nombre;
  @override
  int codDocumento;
  @override
  String? rutaFormato;
  @override
  String periodo;
  @override
  int meses;
  @override
  DateTime fechaCarga;
  @override
  DateTime fechaEmision;
  @override
  DateTime fechaCaducidad;
  @override
  String rutaArchivo;
  @override
  String nombreArchivo;
  @override
  String nombreOriginal;
  @override
  bool cumplio;
  @override
  bool tieneLista;
  @override
  String? estado2;
  @override
  String estado;
  @override
  String estadoAdmin;
  @override
  int fechaActualizar;

  GeneralDocumentContractorModel({
      required this.codigo,
      required this.nombre,
      required this.codDocumento,
      this.rutaFormato,
      required this.periodo,
      required this.meses,
      required this.fechaCarga,
      required this.fechaEmision,
      required this.fechaCaducidad,
      required this.rutaArchivo,
      required this.nombreArchivo,
      required this.nombreOriginal,
      required this.cumplio,
      required this.tieneLista,
      this.estado2,
      required this.estado,
      required this.estadoAdmin,
      required this.fechaActualizar,
  }) : super(
    codigo: codigo , 
    nombre: nombre, 
    codDocumento: codDocumento, 
    rutaFormato: rutaFormato,
    periodo: periodo,
    meses: meses,
    fechaCarga: fechaCarga,
    fechaEmision: fechaEmision,
    fechaCaducidad: fechaCaducidad,
    rutaArchivo: rutaArchivo,
    nombreArchivo: nombreArchivo,
    nombreOriginal: nombreOriginal,
    cumplio: cumplio,
    tieneLista: tieneLista,
    estado2: estado2,
    estado: estado,
    estadoAdmin: estadoAdmin,
    fechaActualizar: fechaActualizar
    );

  factory GeneralDocumentContractorModel.fromJson(Map<String, dynamic> json) => GeneralDocumentContractorModel(
      codigo: json["codigo"],
      nombre: json["nombre"],
      codDocumento: json["codDocumento"],
      rutaFormato: json["rutaFormato"],
      periodo: json["periodo"],
      meses: json["meses"],
      fechaCarga: DateTime.parse(json["fechaCarga"]),
      fechaEmision: DateTime.parse(json["fechaEmision"]),
      fechaCaducidad: DateTime.parse(json["fechaCaducidad"]),
      rutaArchivo: json["rutaArchivo"],
      nombreArchivo: json["nombreArchivo"],
      nombreOriginal: json["nombreOriginal"],
      cumplio: json["cumplio"],
      tieneLista: json["tieneLista"],
      estado2: json["estado2"],
      estado: json["estado"],
      estadoAdmin: json["estadoAdmin"],
      fechaActualizar: json["fechaActualizar"],
  );

  Map<String, dynamic> toJson() => {
      "codigo": codigo,
      "nombre": nombre,
      "codDocumento": codDocumento,
      "rutaFormato": rutaFormato,
      "periodo": periodo,
      "meses": meses,
      "fechaCarga": fechaCarga.toIso8601String(),
      "fechaEmision": fechaEmision.toIso8601String(),
      "fechaCaducidad": fechaCaducidad.toIso8601String(),
      "rutaArchivo": rutaArchivo,
      "nombreArchivo": nombreArchivo,
      "nombreOriginal": nombreOriginal,
      "cumplio": cumplio,
      "tieneLista": tieneLista,
      "estado2": estado2,
      "estado": estado,
      "estadoAdmin": estadoAdmin,
      "fechaActualizar": fechaActualizar,
  };
}
