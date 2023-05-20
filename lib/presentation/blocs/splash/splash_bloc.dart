import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/domain/usecases/splash/data_validate.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final DataValidate dataValidate;

  SplashBloc(this.dataValidate) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {

      if(event is StartValidation){

        emit(SplashValidating());
        final isValidate = await dataValidate();

        if( isValidate ){
          emit(SplashValidated());
        }else{
          emit(SplashUnvalidated());
        }

      }

    });
  }
}
