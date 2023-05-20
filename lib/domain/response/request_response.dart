import 'dart:convert';

CreateRequestResponse createRequestResponseFromJson(String str) => CreateRequestResponse.fromJson(json.decode(str));

String createRequestResponseToJson(CreateRequestResponse data) => json.encode(data.toJson());

class CreateRequestResponse {
    int estado;
    int codCabecera;

    CreateRequestResponse({
      required this.estado,
      required this.codCabecera,
    });

    factory CreateRequestResponse.fromJson(Map<String, dynamic> json) => CreateRequestResponse(
      estado: json["estado"],
      codCabecera: json["codCabecera"],
    );

    Map<String, dynamic> toJson() => {
      "estado": estado,
      "codCabecera": codCabecera,
    };
}
