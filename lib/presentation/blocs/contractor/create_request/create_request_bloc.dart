import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/domain/entities/campus.dart';
import 'package:smart/domain/entities/context_type.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/domain/entities/representative.dart';
import 'package:smart/domain/entities/sucursal.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/domain/response/request_response.dart';
import 'package:smart/domain/usecases/request/add_request.dart';
import 'package:crypto/crypto.dart';
import 'package:smart/domain/usecases/request/update_code_encrypt.dart';

part 'create_request_event.dart';
part 'create_request_state.dart';

class CreateRequestBloc extends Bloc<CreateRequestEvent, CreateRequestState> {

  EntryType? entryType;
  ContextType? contextType;
  Sucursal? sucursal;
  Campus? campus;
  Representative? representative;
  DateTime? starDate;
  DateTime? endDate;
  AddRequest addRequest;
  UpdateCodeEncrypt updateCodeEncrypt;

  CreateRequestBloc( this.addRequest, this.updateCodeEncrypt  ) : super(CreateRequestInitial()) {
    on<CreateRequestEvent>((event, emit) async {
      if( event is AddRequestEvent ) {
        emit(CreateRequestLoading());
        final response  = await addRequest(event.request);
        final bytes     = utf8.encode("${response.codCabecera}");
        final digest    = md5.convert(bytes);
        final response1 = await updateCodeEncrypt( response.codCabecera, digest.toString(), event.request.creadoPor);
        emit(CreateRequestLoaded(response));
      }
    });
  }

  // CreateRequestState _failureOrLogin(Either<Failure, CreateRequestResponse> failureOrLogin){
  //   return failureOrLogin.fold(
  //     (failure) => CreateRequestError(_mapFailureToMessage(failure)), 
  //     (response) {
  //       print(response.codCabecera);
  //       final bytes  = utf8.encode("${response.codCabecera}");
  //       final digest = md5.convert(bytes); 
  //       print(digest.toString());
  //       final reponse1 = await updateCodeEncrypt( response.codCabecera, digest.toString() );
  //       return CreateRequestLoaded(response);
  //     }
  //   );
  // }

  // String _mapFailureToMessage( Failure failure ){
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return "Ha ocurrido un error, Por favor intenta denuevo";
  //     case AuthFailure:
  //       return failure.message;
  //     default:
  //       return "Error inesperado";
  //   }
  // }

}
