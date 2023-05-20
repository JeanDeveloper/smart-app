import 'package:equatable/equatable.dart';

class Solicitud extends Equatable {
  Solicitud({
    required this.code,
    required this.encryptCode,
    required this.customerCode,
    required this.nroPeople,
    required this.typeEntry,
    required this.campus,
    required this.subCampus,
    required this.ambit,
    required this.enterPrise,
    required this.ruc,
    required this.startDate,
    required this.endDate,
    required this.endState,
    required this.status,
  });

  int      code;
  String   encryptCode;
  String   customerCode;
  int      nroPeople;
  String   typeEntry;
  String   campus;
  String   subCampus;
  String   ambit;
  String   enterPrise;
  String   ruc;
  DateTime startDate;
  DateTime endDate;
  int      endState;
  String   status;

  @override
  List<Object?> get props => [
    code,
    encryptCode,
    customerCode,
    nroPeople,
    typeEntry,
    campus,
    subCampus,
    ambit,
    enterPrise,
    ruc,
    startDate,
    endDate,
    endState,
    status,
  ];
}
