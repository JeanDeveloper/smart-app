import 'dart:convert';

abstract class ApiWassengerResponse{}

ApiWassengerSucessResponse apiWassengerSucessResponseFromJson(String str) => ApiWassengerSucessResponse.fromJson(json.decode(str));


class ApiWassengerSucessResponse extends ApiWassengerResponse {
  String id;
  String waId;
  String phone;
  String wid;
  String status;
  String deliveryStatus;
  DateTime createdAt;
  DateTime deliverAt;
  String message;
  String priority;
  String retentionPolicy;
  Retry retry;
  String webhookStatus;
  String device;

  ApiWassengerSucessResponse({
    required this.id,
    required this.waId,
    required this.phone,
    required this.wid,
    required this.status,
    required this.deliveryStatus,
    required this.createdAt,
    required this.deliverAt,
    required this.message,
    required this.priority,
    required this.retentionPolicy,
    required this.retry,
    required this.webhookStatus,
    required this.device,
  });

  factory ApiWassengerSucessResponse.fromJson(Map<String, dynamic> json) => ApiWassengerSucessResponse(
    id: json["id"],
    waId: json["waId"],
    phone: json["phone"],
    wid: json["wid"],
    status: json["status"],
    deliveryStatus: json["deliveryStatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    deliverAt: DateTime.parse(json["deliverAt"]),
    message: json["message"],
    priority: json["priority"],
    retentionPolicy: json["retentionPolicy"],
    retry: Retry.fromJson(json["retry"]),
    webhookStatus: json["webhookStatus"],
    device: json["device"],
  );

}

class Retry {
  int max;
  int count;

  Retry({
    required this.max,
    required this.count,
  });

  factory Retry.fromJson(Map<String, dynamic> json) => Retry(
    max: json["max"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "max": max,
    "count": count,
  };
}


ApiWassengerErrorResponse apiWassengerErrorResponseFromJson(String str) => ApiWassengerErrorResponse.fromJson(json.decode(str));

class ApiWassengerErrorResponse extends ApiWassengerResponse {
  int status;
  String message;
  String errorCode;
  List<dynamic> errors;

  ApiWassengerErrorResponse({
    required this.status,
    required this.message,
    required this.errorCode,
    required this.errors,
  });

  factory ApiWassengerErrorResponse.fromJson(Map<String, dynamic> json) => ApiWassengerErrorResponse(
    status: json["status"],
    message: json["message"],
    errorCode: json["errorCode"],
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
  );

}
