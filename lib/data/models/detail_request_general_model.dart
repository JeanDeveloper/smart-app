import 'dart:convert';

import 'package:smart/domain/entities/general_document.dart';
List<GeneralDocumentModel> detailRequestGeneralModelFromJson(String str) => List<GeneralDocumentModel>.from(json.decode(str).map((x) => GeneralDocumentModel.fromJson(x)));


class GeneralDocumentModel extends GeneralDocument {
    GeneralDocumentModel({
        required this.codigo,
        required this.nombre,
        required this.tieneLista,
        required this.codDocumento,
        required this.fechaCarga,
        required this.fechaEmision,
        required this.fechaCaducidad,
        required this.rutaArchivo,
        required this.estadoDoc,
        required this.aprobado,
        required this.estado,
        this.estado2,
        this.observaciones,
        required this.permisoAprobacion,
    }) : super(
      codigo: codigo, 
      nombre: nombre, 
      tieneLista: tieneLista, 
      codDocumento: codDocumento, 
      fechaCarga: fechaCarga, 
      fechaEmision: fechaEmision, 
      fechaCaducidad: fechaCaducidad, 
      rutaArchivo: rutaArchivo, 
      estadoDoc: estadoDoc, 
      aprobado: aprobado, 
      estado: estado,
      estado2: estado2,
      observaciones: observaciones,
      permisoAprobacion: permisoAprobacion,
    );

    @override
  int codigo;
    @override
  String nombre;
    @override
  bool tieneLista;
    @override
  int codDocumento;
    @override
  DateTime? fechaCarga;
    @override
  DateTime? fechaEmision;
    @override
  DateTime? fechaCaducidad;
    @override
  String? rutaArchivo;
    @override
  String estadoDoc;
    @override
  int aprobado;
    @override
  String estado;
    @override
  String? estado2;
    @override
  String? observaciones;
    @override
  bool permisoAprobacion;

    factory GeneralDocumentModel.fromJson(Map<String, dynamic> json) => GeneralDocumentModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        tieneLista: json["tieneLista"],
        codDocumento: json["codDocumento"],
        fechaCarga: DateTime.parse(json["fechaCarga"]),
        fechaEmision: DateTime.parse(json["fechaEmision"]),
        fechaCaducidad: DateTime.parse(json["fechaCaducidad"]),
        rutaArchivo: json["rutaArchivo"],
        estadoDoc: json["estadoDoc"],
        aprobado: json["aprobado"],
        estado: json["estado"],
        estado2: json["estado2"],
        observaciones: json["observaciones"],
        permisoAprobacion: json["permisoAprobacion"],
    );


}
