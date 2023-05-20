import 'package:equatable/equatable.dart';

class RegisterStatusRequestRequest extends Equatable{
  int codCabecera;
  int codEstado;
  String creadoPor;

  RegisterStatusRequestRequest({
    required this.codCabecera,
    required this.codEstado,
    required this.creadoPor,
  });
  @override
  List<Object?> get props => [ codCabecera,codEstado,creadoPor ];
}
