import 'dart:convert';

import 'package:smart/domain/entities/state_course.dart';

class CourseStateModel extends CourseState{
  CourseStateModel({
    required this.status,
    this.startDate,
    this.endDate,
  }) : super(status: status, startDate: startDate, endDate: endDate) ;

  String status;
  @override
  DateTime? startDate;
  @override
  DateTime? endDate;

  factory CourseStateModel.fromJson(Map<String, dynamic> json) => CourseStateModel(
    status: json["estado"],
    startDate: DateTime.parse(json["fechaEmision"]),
    endDate: DateTime.parse(json["fechaCaducidad"]),
  );

  Map<String, dynamic> toJson() => {
    "estado": status,
    "fechaEmision": startDate,
    "fechaCaducidad": endDate,
  };

}
