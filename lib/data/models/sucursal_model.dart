
import 'dart:convert';

import 'package:smart/domain/entities/sucursal.dart';

List<SucursalModel> sucursalModelFromJson(String str) => List<SucursalModel>.from(json.decode(str).map((x) => SucursalModel.fromJson(x)));

String sucursalModelToJson(List<SucursalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SucursalModel extends Sucursal{
    int codigo;
    String codCliente;
    String descripcion;
    bool habilitado;
    int codSucursal;
    int ambito;

    SucursalModel({
        required this.codigo,
        required this.codCliente,
        required this.descripcion,
        required this.habilitado,
        required this.codSucursal,
        required this.ambito,
    }) : super(codigo: codigo, codCliente: codCliente, descripcion: descripcion, habilitado: habilitado, codSucursal: codSucursal, ambito: ambito);

    factory SucursalModel.fromJson(Map<String, dynamic> json) => SucursalModel(
        codigo: json["codigo"],
        codCliente: json["codCliente"],
        descripcion: json["descripcion"],
        habilitado: json["habilitado"],
        codSucursal: json["codSucursal"],
        ambito: json["ambito"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "codCliente": codCliente,
        "descripcion": descripcion,
        "habilitado": habilitado,
        "codSucursal": codSucursal,
        "ambito": ambito,
    };
}
