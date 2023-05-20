import 'dart:convert';

import 'package:smart/domain/entities/person_document_request_contractor.dart';

List<PersonDocumentRequestContractorModel> personDocumentRequestContractorModelFromJson(String str) => List<PersonDocumentRequestContractorModel>.from(json.decode(str).map((x) => PersonDocumentRequestContractorModel.fromJson(x)));

String personDocumentRequestContractorModelToJson(List<PersonDocumentRequestContractorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonDocumentRequestContractorModel extends PersonDocumentRequestContractor{
    @override
  int codSolDoc;
    @override
  int codDocumento;
    @override
  String nombre;
    @override
  String tipo;
    @override
  bool cargadoVerificador;
    @override
  bool cumplio;
    @override
  int codigoSd;
    @override
  int estadoFecha;
    @override
  int estadoObs;

    PersonDocumentRequestContractorModel({
        required this.codSolDoc,
        required this.codDocumento,
        required this.nombre,
        required this.tipo,
        required this.cargadoVerificador,
        required this.cumplio,
        required this.codigoSd,
        required this.estadoFecha,
        required this.estadoObs,
    }) : super(codSolDoc: codSolDoc, codDocumento: codDocumento, nombre: nombre, tipo: tipo, cargadoVerificador: cargadoVerificador, cumplio: cumplio, codigoSd: codigoSd, estadoFecha: estadoFecha, estadoObs: estadoObs);

    factory PersonDocumentRequestContractorModel.fromJson(Map<String, dynamic> json) => PersonDocumentRequestContractorModel(
        codSolDoc: json["codSolDoc"],
        codDocumento: json["codDocumento"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        cargadoVerificador: json["cargadoVerificador"],
        cumplio: json["cumplio"],
        codigoSd: json["codigoSD"],
        estadoFecha: json["estado_fecha"],
        estadoObs: json["estado_obs"],
    );

    Map<String, dynamic> toJson() => {
        "codSolDoc": codSolDoc,
        "codDocumento": codDocumento,
        "nombre": nombre,
        "tipo": tipo,
        "cargadoVerificador": cargadoVerificador,
        "cumplio": cumplio,
        "codigoSD": codigoSd,
        "estado_fecha": estadoFecha,
        "estado_obs": estadoObs,
    };
}
