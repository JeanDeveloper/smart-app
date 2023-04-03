part of 'request_bloc_bloc.dart';

@immutable
abstract class RequestBlocState {}

class RequestBlocInitial extends RequestBlocState{
  final List<Request> request = [];
  final int index = 0;
}

// class RequestBlocError extends RequestBlocState{
//   final String message =  "";
// }
