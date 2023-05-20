import 'package:equatable/equatable.dart';

class PersonDocumentRequestContractor extends Equatable{
    int codSolDoc;
    int codDocumento;
    String nombre;
    String tipo;
    bool cargadoVerificador;
    bool cumplio;
    int codigoSd;
    int estadoFecha;
    int estadoObs;

    PersonDocumentRequestContractor({
        required this.codSolDoc,
        required this.codDocumento,
        required this.nombre,
        required this.tipo,
        required this.cargadoVerificador,
        required this.cumplio,
        required this.codigoSd,
        required this.estadoFecha,
        required this.estadoObs,
    });
      @override
      // TODO: implement props
      List<Object?> get props => [
        codSolDoc,
        codDocumento,
        nombre,
        tipo,
        cargadoVerificador,
        cumplio,
        codigoSd,
        estadoFecha,
        estadoObs
      ];

}
