import 'dart:convert';

import 'package:smart/domain/entities/observation.dart';

List<ObservationModel> observationModelFromJson(String str) => List<ObservationModel>.from(json.decode(str).map((x) => ObservationModel.fromJson(x)));

String observationModelToJson(List<ObservationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObservationModel extends Observation {
  ObservationModel({
    required this.observacion,
    required this.creado,
  }) : super(
    observacion: observacion, 
    creado: creado
  );

  @override
  String observacion;
  @override
  DateTime creado;

  factory ObservationModel.fromJson(Map<String, dynamic> json) => ObservationModel(
    observacion: json["observacion"],
    creado: DateTime.parse(json["creado"]),
  );

  Map<String, dynamic> toJson() => {
    "observacion": observacion,
    "creado": creado.toIso8601String(),
  };

}
