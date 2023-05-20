part of 'solicitud_bloc.dart';

abstract class SolicitudEvent extends Equatable {
  const SolicitudEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends SolicitudEvent{
  final int enterPriseCode;
  final String customerCode ;
  const InitialEvent(this.enterPriseCode, this.customerCode);
}

// class ShowSolicitudPersonal extends SolicitudEvent{
//   final int headCode;
//   const ShowRequestPersonal(this.headCode);
// }
