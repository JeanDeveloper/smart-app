import 'dart:convert';

RegisterStatusRequest registerStatusRequestFromJson(String str) => RegisterStatusRequest.fromJson(json.decode(str));

String registerStatusRequestToJson(RegisterStatusRequest data) => json.encode(data.toJson());

class RegisterStatusRequest {
  RegisterStatusRequest({
    required this.codSolDoc,
    required this.codEstado,
    required this.obs,
    required this.creadoPor,
  });

  int codSolDoc;
  int codEstado;
  String? obs;
  String creadoPor;

  factory RegisterStatusRequest.fromJson(Map<String, dynamic> json) => RegisterStatusRequest(
    codSolDoc: json["codSolDoc"],
    codEstado: json["codEstado"],
    obs: json["obs"],
    creadoPor: json["creadoPor"],
  );

  Map<String, dynamic> toJson() => {
    "codSolDoc": codSolDoc,
    "codEstado": codEstado,
    "obs": obs,
    "creadoPor": creadoPor,
  };
}
