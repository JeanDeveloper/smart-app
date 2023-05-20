import 'package:equatable/equatable.dart';

class DocumentPermission extends Equatable{
  DocumentPermission({
    required this.codPermiso,
    required this.codDoc,
    required this.abreviatura,
  });

  int codPermiso;
  int codDoc;
  String abreviatura;
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    codPermiso,
    codDoc,
    abreviatura
  ];
}
