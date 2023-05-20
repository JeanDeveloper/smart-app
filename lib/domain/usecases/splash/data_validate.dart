import 'package:smart/domain/repositories/iauth_repository.dart';
import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class DataValidate{
  final ILocalStorageRepository iLocalStorageRepository;
  final IAuthRepository iAuthRepository;


  DataValidate(this.iLocalStorageRepository, this.iAuthRepository);

  Future<bool> call() async {

    final token = await iLocalStorageRepository.getToken();

    if( token != "" ) {

      // final user  = await iLocalStorageRepository.getUser();
      // final isDarkMode = iLocalStorageRepository.isDarkMode();

      return true;

    }else{
      return false;
    }
  }

}