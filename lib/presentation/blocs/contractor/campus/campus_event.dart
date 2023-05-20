part of 'campus_bloc.dart';

abstract class CampusEvent extends Equatable {
  const CampusEvent();

  @override
  List<Object> get props => [];
}

class CampusInitialEvent extends CampusEvent{
  final int codSede;
  const CampusInitialEvent(this.codSede);
}
