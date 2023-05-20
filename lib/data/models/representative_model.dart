import 'dart:convert';

import 'package:smart/domain/entities/representative.dart';

List<RepresentativeModel> representativeModelFromJson(String str) => List<RepresentativeModel>.from(json.decode(str).map((x) => RepresentativeModel.fromJson(x)));

String representativeModelToJson(List<RepresentativeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RepresentativeModel extends Representative{
  String personal;
  String? nroDoc;
  String codigoPers;

  RepresentativeModel({
    required this.personal,
    this.nroDoc,
    required this.codigoPers,
  }) : super(personal: personal, nroDoc: nroDoc, codigoPers: codigoPers);

  factory RepresentativeModel.fromJson(Map<String, dynamic> json) => RepresentativeModel(
    personal: json["personal"],
    nroDoc: json["nroDoc"],
    codigoPers: json["codigO_PERS"],
  );

  Map<String, dynamic> toJson() => {
    "personal": personal,
    "nroDoc": nroDoc,
    "codigO_PERS": codigoPers,
  };
}
