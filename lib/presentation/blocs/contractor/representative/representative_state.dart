part of 'representative_bloc.dart';

abstract class RepresentativeState extends Equatable {
  const RepresentativeState();
  
  @override
  List<Object> get props => [];
}

class RepresentativeInitial extends RepresentativeState {}

class RepresentativeLoading extends RepresentativeState {}

class RepresentativeLoaded extends RepresentativeState {
  final List<Representative> representative;
  const RepresentativeLoaded(this.representative);
}

class RepresentativeError extends RepresentativeState {
  final String message;
  const RepresentativeError(this.message);
}


