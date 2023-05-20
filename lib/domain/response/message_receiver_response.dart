import 'dart:convert';

List<MsgReceiverResponse> msgReceiverResponseFromJson(String str) => List<MsgReceiverResponse>.from(json.decode(str).map((x) => MsgReceiverResponse.fromJson(x)));

String msgReceiverResponseToJson(List<MsgReceiverResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MsgReceiverResponse {
  String cliente;
  String empresa;
  int codCabecera;
  String codCliente;
  String contratista;
  String usuarioContratista;
  String fonoContratista;
  int codAutorizante;
  String dniAutorizante;
  String autorizante;
  String fullnameAutorizante;
  String nombreAutorizante;
  String fonoAutorizante;
  String emailAutorizante;
  String sede;
  String subsede;
  int solicitados;
  int completadosCor;
  int completados;
  int observados;
  int incompletos;
  int autorizados;

  MsgReceiverResponse({
    required this.cliente,
    required this.empresa,
    required this.codCabecera,
    required this.codCliente,
    required this.contratista,
    required this.usuarioContratista,
    required this.fonoContratista,
    required this.codAutorizante,
    required this.dniAutorizante,
    required this.autorizante,
    required this.fullnameAutorizante,
    required this.nombreAutorizante,
    required this.fonoAutorizante,
    required this.emailAutorizante,
    required this.sede,
    required this.subsede,
    required this.solicitados,
    required this.completadosCor,
    required this.completados,
    required this.observados,
    required this.incompletos,
    required this.autorizados,
  });

  factory MsgReceiverResponse.fromJson(Map<String, dynamic> json) => MsgReceiverResponse(
    cliente: json["cliente"],
    empresa: json["empresa"],
    codCabecera: json["codCabecera"],
    codCliente: json["codCliente"],
    contratista: json["contratista"],
    usuarioContratista: json["usuario_contratista"],
    fonoContratista: json["fono_contratista"],
    codAutorizante: json["codAutorizante"],
    dniAutorizante: json["dni_autorizante"],
    autorizante: json["autorizante"],
    fullnameAutorizante: json["fullname_autorizante"],
    nombreAutorizante: json["nombre_autorizante"],
    fonoAutorizante: json["fono_autorizante"],
    emailAutorizante: json["email_autorizante"],
    sede: json["sede"],
    subsede: json["subsede"],
    solicitados: json["solicitados"],
    completadosCor: json["completos_cor"],
    completados: json["completos"],
    observados: json["observados"],
    incompletos: json["incompletos"],
    autorizados: json["autorizados"],
  );

  Map<String, dynamic> toJson() => {
    "cliente": cliente,
    "empresa": empresa,
    "codCabecera": codCabecera,
    "codCliente": codCliente,
    "contratista": contratista,
    "usuario_contratista": usuarioContratista,
    "fono_contratista": fonoContratista,
    "codAutorizante": codAutorizante,
    "dni_autorizante": dniAutorizante,
    "autorizante": autorizante,
    "fullname_autorizante": fullnameAutorizante,
    "nombre_autorizante": nombreAutorizante,
    "fono_autorizante": fonoAutorizante,
    "email_autorizante": emailAutorizante,
    "sede": sede,
    "subsede": subsede,
    "solicitados": solicitados,
    "completados_cor": completadosCor,
    "completados": completados,
    "observados": observados,
    "incompletos": incompletos,
    "autorizados": autorizados,
  };
}
