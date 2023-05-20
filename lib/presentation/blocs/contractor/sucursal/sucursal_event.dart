part of 'sucursal_bloc.dart';

abstract class SucursalEvent extends Equatable {
  const SucursalEvent();

  @override
  List<Object> get props => [];
}

class SucursalInitialEvent extends SucursalEvent{
  final String customerCode;
  final String conText;
  const SucursalInitialEvent(this.customerCode, this.conText);
}
