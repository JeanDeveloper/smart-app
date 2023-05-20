part of 'sucursal_bloc.dart';

abstract class SucursalState extends Equatable {
  const SucursalState();
  
  @override
  List<Object> get props => [];
}

class SucursalInitial extends SucursalState {}

class SucursalLoading extends SucursalState {}

class SucursalLoaded extends SucursalState {
  final List<Sucursal> sucursales;
  const SucursalLoaded(this.sucursales);
}

class SucursalError extends SucursalState {
  final String message;
  const SucursalError(this.message);
}