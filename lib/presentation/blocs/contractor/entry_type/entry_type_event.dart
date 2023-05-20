part of 'entry_type_bloc.dart';

abstract class EntryTypeEvent extends Equatable {
  const EntryTypeEvent();
  @override
  List<Object> get props => [];
}

class EntryTypeInitialEvent extends EntryTypeEvent{
  final String customerCode;
  const EntryTypeInitialEvent(this.customerCode);
}
