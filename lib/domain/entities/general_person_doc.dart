import 'package:equatable/equatable.dart';

class GeneralPersonDoc extends Equatable{
  GeneralPersonDoc({
    required this.nroDoc,
    required this.cumplio,
    required this.fullname,
    required this.fechaEmision,
    required this.fechaCaducidad,
  });

  String nroDoc;
  bool cumplio;
  String fullname;
  String? fechaEmision;
  String? fechaCaducidad;
  
  @override
  List<Object?> get props => [
    nroDoc,
    cumplio,
    fullname,
    fechaEmision,
    fechaCaducidad,
  ];

}
