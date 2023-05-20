import 'dart:convert';

import 'package:smart/domain/entities/person_document_request.dart';

List<PersonDocumentRequestModel> personDocumentRequestModelFromJson(String str) => List<PersonDocumentRequestModel>.from(json.decode(str).map((x) => PersonDocumentRequestModel.fromJson(x)));

String personDocumentRequestModelToJson(List<PersonDocumentRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonDocumentRequestModel extends PersonDocumentRequest {

    PersonDocumentRequestModel({
      required this.codigo,
      required this.codEstadoSolDoc,
      required this.codDoc,
      required this.nombre,
      required this.cargadoVerificador,
      this.fechaCarga,
      this.fechaEmision,
      this.fechaCaducidad,
      required this.dosis,
      this.rutaArchivo,
      required this.estadoFecha,
      required this.aprobado,
      required this.estado,
      this.observaciones,
      required this.permisoAprobacion,
    }) : super(
      codigo: codigo, 
      codEstadoSolDoc: codEstadoSolDoc, 
      codDoc: codDoc, 
      nombre: nombre, 
      cargadoVerificador: cargadoVerificador,
      fechaCarga: fechaCarga,
      fechaEmision: fechaEmision,
      fechaCaducidad: fechaCaducidad,
      dosis: dosis,
      rutaArchivo: rutaArchivo,
      estadoFecha: estadoFecha,
      aprobado: aprobado,
      estado: estado,
      observaciones: observaciones,
      permisoAprobacion: permisoAprobacion,
    );

    @override
  int codigo;
    @override
  int codEstadoSolDoc;
    @override
  int codDoc;
    @override
  String nombre;
    @override
  bool cargadoVerificador;
    @override
  String? fechaCarga;
    @override
  String? fechaEmision;
    @override
  String? fechaCaducidad;
    @override
  String? dosis;
    @override
  String? rutaArchivo;
    @override
  bool estadoFecha;
    @override
  int aprobado;
    @override
  String estado;
    @override
  String? observaciones;
    @override
  int permisoAprobacion;

    factory PersonDocumentRequestModel.fromJson(Map<String, dynamic> json) => PersonDocumentRequestModel(
      codigo: json["codigo"],
      codEstadoSolDoc: json["codEstadoSolDoc"],
      codDoc: json["codDoc"],
      nombre: json["nombre"],
      cargadoVerificador: json["cargadoVerificador"],
      fechaCarga: json["fechaCarga"],
      fechaEmision: json["fechaEmision"],
      fechaCaducidad: json["fechaCaducidad"],
      dosis: json["dosis"],
      rutaArchivo: json["rutaArchivo"],
      estadoFecha: json["estado_fecha"],
      aprobado: json["aprobado"],
      estado: json["estado"],
      observaciones: json["observaciones"],
      permisoAprobacion: json["permisoAprobacion"],
    );

    Map<String, dynamic> toJson() => {
      "codigo": codigo,
      "codEstadoSolDoc": codEstadoSolDoc,
      "codDoc": codDoc,
      "nombre": nombre,
      "cargadoVerificador": cargadoVerificador,
      "fechaCarga": fechaCarga,
      "fechaEmision": fechaEmision,
      "fechaCaducidad": fechaCaducidad,
      "dosis": dosis,
      "rutaArchivo": rutaArchivo,
      "estado_fecha": estadoFecha,
      "aprobado": aprobado,
      "estado": estado,
      "observaciones": observaciones,
      "permisoAprobacion": permisoAprobacion,
    };
}
