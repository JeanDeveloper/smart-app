import 'package:equatable/equatable.dart';

class AuthorizePersonRequest extends Equatable{
  int codCabecera;
  String nroDoc;
  int codDetPersona;
  DateTime fechaInicio;
  DateTime fechaFin;

  AuthorizePersonRequest({
    required this.codCabecera,
    required this.nroDoc,
    required this.codDetPersona,
    required this.fechaInicio,
    required this.fechaFin,
  });

  @override
  List<Object?> get props => [ codCabecera ,nroDoc ,codDetPersona ,fechaInicio ,fechaFin ];

}
