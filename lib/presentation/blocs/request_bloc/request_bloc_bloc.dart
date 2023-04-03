import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart/data/models/request_model.dart';

part 'request_bloc_event.dart';
part 'request_bloc_state.dart';

class RequestBlocBloc extends Bloc<RequestBlocEvent, RequestBlocState> { 

  RequestBlocBloc() : super(RequestBlocInitial()) {

    on<RequestBlocEvent>( (event, emit) async {

    });
  }
}
