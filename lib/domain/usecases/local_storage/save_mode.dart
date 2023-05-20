import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class SaveMode {

  final ILocalStorageRepository iLocalStorageRepository;

  SaveMode(this.iLocalStorageRepository);

  Future<bool> call(bool isDarkMode) async {
    await iLocalStorageRepository.saveDarkMode(isDarkMode);
    return true;
  }

}