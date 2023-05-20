part of 'entry_type_bloc.dart';

abstract class EntryTypeState extends Equatable {
  const EntryTypeState();
  
  @override
  List<Object> get props => [];
}

class EntryTypeInitial extends EntryTypeState {}

class EntryTypeLoading extends EntryTypeState {}

class EntryTypeLoaded extends EntryTypeState {
  final List<EntryType> entryTypes;
  const EntryTypeLoaded(this.entryTypes);
}

class EntryTypeError extends EntryTypeState {
  final String message;
  const EntryTypeError(this.message);
}


