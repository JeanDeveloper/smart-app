class Request {
  final String code;
  final String enterprise;
  final String entryType;
  final String sucursal;
  final String campus;
  final String ambito;
  final String startDate;
  final String endDate;
  final int peoplecounter;
  final int status;

  Request(
      this.code,
      this.enterprise,
      this.entryType,
      this.sucursal,
      this.campus,
      this.ambito,
      this.startDate,
      this.endDate,
      this.peoplecounter,
      this.status);
}

final requests = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 1),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 2),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 3),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 1, 4),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 5),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 4, 6),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 7),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 10, 5),
];



final requestsAuthority = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 1),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 1),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 1),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 1, 1),
];

final requestsMiddAuthority = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 2),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 2),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 2),
];

final requestsObserver = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 3),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 3),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 3),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 3),
];

final requestsPendient = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 4),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 4),
];


final requestsComplete = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 5),
];


final requestsVencido = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 6),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 6),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 6),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 6),
];


final requestsSend = [
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 2, 7),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 3, 7),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 5, 7),
  Request("23358", "CENTRO NACIONAL DE SERVICIO (CNS)", "VISITA TECNICA", "CHIMBOTE",
      "PLANTA COISHCO", "PLANTA", "28/03/2023", "30/03/2023", 1, 7),
];