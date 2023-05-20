import 'dart:convert';

CreatePersonResponse createPersonResponseFromJson(String str) => CreatePersonResponse.fromJson(json.decode(str));

String createPersonResponseToJson(CreatePersonResponse data) => json.encode(data.toJson());

class CreatePersonResponse {
  int estado;
  int personalMaestros;

  CreatePersonResponse({
    required this.estado,
    required this.personalMaestros,
  });

  factory CreatePersonResponse.fromJson(Map<String, dynamic> json) => CreatePersonResponse(
    estado: json["estado"],
    personalMaestros: json["personal_maestros"],
  );

  Map<String, dynamic> toJson() => {
    "estado": estado,
    "personal_maestros": personalMaestros,
  };
}
