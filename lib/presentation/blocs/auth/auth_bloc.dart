import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:smart/domain/response/login_response.dart';
import 'package:smart/domain/usecases/auth/login.dart';
import 'package:smart/domain/usecases/local_storage/delete_data.dart';
import 'package:smart/domain/usecases/local_storage/save_data.dart';
import 'package:smart/domain/usecases/splash/data_validate.dart';
import 'package:smart/presentation/blocs/auth/get_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final HasLogin hasLogin;
  final SaveData saveData;
  final DeleteData deleteData;
  final GetUserStorage getUserStorage;
  final DataValidate dataValidate;

  User? user;

  AuthBloc(this.hasLogin, this.saveData, this.deleteData, this.getUserStorage, this.dataValidate) : super(AuthInitial()) {

    on<AuthEvent>( ( event, emit ) async {

      if(event is DoLoginEvent){
        emit(AuthLoading());
        final failureOrUser =  await hasLogin(event.username, event.password);
        emit(_failureOrLogin(failureOrUser));
      }

      if( event is DoLogoutEvent){
        emit(AuthLoading());
        await deleteData();
        emit(AuthLogout());
      }

      if( event is GetUserStorageEvent){
        emit(AuthLoading());
        final usuario = await getUserStorage();
        user = usuario;
        emit(AuthLoged(usuario));
      }

      if( event is StartValidation ){
        final isValidate = await dataValidate();

        if( isValidate ){
          final usuario = await getUserStorage();
          user = usuario;
          emit(AuthLoged(usuario));
        }else{
          emit(AuthUnvalidated());
        }


      }

    });

  }

  AuthState _failureOrLogin(Either<Failure, LoginResponse> failureOrLogin){
    return failureOrLogin.fold(
      (failure) => AuthError(_mapFailureToMessage(failure)), 
      (loginResponse) {
        saveData(loginResponse);
        user = loginResponse.user;
        return AuthLoged(loginResponse.user);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      case AuthFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }

}
