class PersonRequestAutority {
  PersonRequestAutority({
      required this.fullname,
      required this.nroDoc,
      required this.ruc,
      required this.fechaIniPer,
      required this.fechaFinPer,
      required this.aprobado,
      required this.induccion,
      required this.autorizado,
      required this.estadoTotal,
      required this.codDetPersona,
      required this.fecha,
  });

  String fullname;
  String nroDoc;
  String ruc;
  DateTime fechaIniPer;
  DateTime fechaFinPer;
  int aprobado;
  bool induccion;
  int autorizado;
  int estadoTotal;
  int codDetPersona;
  String fecha;
}
