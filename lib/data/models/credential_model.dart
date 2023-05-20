import 'dart:convert';
import 'package:smart/domain/entities/credential.dart';

List<CredentialModel> credentialModelFromJson(String str) => List<CredentialModel>.from(json.decode(str).map((x) => CredentialModel.fromJson(x)));

String credentialModelToJson(List<CredentialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CredentialModel extends Credential {
    CredentialModel({
        required this.codigo,
        required this.fullname,
        required this.email,
        required this.usuario,
        required this.habilitado,
        required this.telefono,
        required this.fechaCreacion,
    }) : super(codigo: codigo, fullname: fullname, email: email, usuario: usuario, 
    habilitado: habilitado, telefono: telefono, fechaCreacion: fechaCreacion, );

    @override
  int codigo;
    @override
  String fullname;
    @override
  String email;
    @override
  String usuario;
    @override
  bool habilitado;
    @override
  String telefono;
    @override
  DateTime fechaCreacion;

    factory CredentialModel.fromJson(Map<String, dynamic> json) => CredentialModel(
        codigo: json["codigo"],
        fullname: json["fullname"],
        email: json["email"],
        usuario: json["usuario"],
        habilitado: json["habilitado"],
        telefono: json["telefono"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "fullname": fullname,
        "email": email,
        "usuario": usuario,
        "habilitado": habilitado,
        "telefono": telefono,
        "fecha_creacion": fechaCreacion.toIso8601String(),
    };
}
