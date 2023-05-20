part of 'request_bloc.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();
  @override
  List<Object> get props => [];
}

class InitialEvent extends RequestEvent{
  final String customerCode;
  final int userCode ;
  const InitialEvent(this.customerCode, this.userCode);
}

class ShowRequestPersonal extends RequestEvent{
  final int headCode;
  const ShowRequestPersonal(this.headCode);
}
