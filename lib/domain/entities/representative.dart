import 'package:equatable/equatable.dart';

class Representative extends Equatable{
  String personal;
  String? nroDoc;
  String codigoPers;

  Representative({
    required this.personal,
    this.nroDoc,
    required this.codigoPers,
  });
  
  @override
  List<Object?> get props => [
    personal,
    nroDoc,
    codigoPers
  ];

}
