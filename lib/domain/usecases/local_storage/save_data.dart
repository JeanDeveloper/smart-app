import 'package:smart/domain/repositories/ilocal_storage_repository.dart';
import 'package:smart/domain/response/login_response.dart';

class SaveData {

  final ILocalStorageRepository iLocalStorageRepository;
  SaveData(this.iLocalStorageRepository);

  Future<bool> call( LoginResponse response) async {

    await iLocalStorageRepository.saveToken(response.token);
    await iLocalStorageRepository.saveUser(response.user);

    return true;

  }

}