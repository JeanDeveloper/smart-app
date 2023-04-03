part of 'request_bloc_bloc.dart';

@immutable
abstract class RequestBlocEvent {}


class ChangeState extends RequestBlocEvent{
  final int index;
  ChangeState(this.index);
}
