import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/domain/usecases/local_storage/get_mode.dart';
import 'package:smart/domain/usecases/local_storage/save_mode.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SaveMode saveMode;
  final GetModeOfStorage getModeOfStorage;

  ProfileBloc(this.saveMode, this.getModeOfStorage) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async{

      if( event is ChangeMode ){

        saveMode(event.isDark);

        if( event.isDark ){
          emit(DarkMode());
        }else{
          emit(LightMode());
        }
      }

      if( event is GetModeStorage ){
        final isModeDark = await getModeOfStorage();

        emit(StoredMode(isModeDark));

      } 

    });
  }
}
