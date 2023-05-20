import 'dart:convert';

import 'package:smart/domain/entities/comment.dart';

List<CommentModel> CommentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String CommentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel extends Comment {
  CommentModel({
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

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    observacion: json["observacion"],
    creado: DateTime.parse(json["creado"]),
  );

  Map<String, dynamic> toJson() => {
    "observacion": observacion,
    "creado": creado.toIso8601String(),
  };

}
