part of 'representative_bloc.dart';

abstract class RepresentativeEvent extends Equatable {
  const RepresentativeEvent();

  @override
  List<Object> get props => [];
}

class RepresentativeInitialEvent extends RepresentativeEvent{
  final int codSede;
  const RepresentativeInitialEvent(this.codSede);
}
