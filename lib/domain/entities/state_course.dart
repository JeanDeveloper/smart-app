import 'package:equatable/equatable.dart';

class CourseState extends Equatable{
  CourseState({
    required this.status,
    this.startDate,
    this.endDate
  });

  String status;
  DateTime? startDate;
  DateTime? endDate;

  @override
  List<Object?> get props => [
    status,
    startDate,
    endDate
  ];

}
