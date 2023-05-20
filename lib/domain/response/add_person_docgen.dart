import 'dart:convert';

AddPersonDocGenResponse addPersonDocGenResponseFromJson(String str) => AddPersonDocGenResponse.fromJson(json.decode(str));

String addPersonDocGenResponseToJson(AddPersonDocGenResponse data) => json.encode(data.toJson());

class AddPersonDocGenResponse {
  String documento;
  int codCabecera;
  int codDocumento;

  AddPersonDocGenResponse({
    required this.documento,
    required this.codCabecera,
    required this.codDocumento,
  });

  factory AddPersonDocGenResponse.fromJson(Map<String, dynamic> json) => AddPersonDocGenResponse(
    documento: json["documento"],
    codCabecera: json["codCabecera"],
    codDocumento: json["codDocumento"],
  );

  Map<String, dynamic> toJson() => {
    "documento": documento,
    "codCabecera": codCabecera,
    "codDocumento": codDocumento,
  };
}
