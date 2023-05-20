import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class GetModeOfStorage{

  final ILocalStorageRepository iLocalStorageRepository;

  GetModeOfStorage(this.iLocalStorageRepository);

  Future<bool> call() async {
    return await iLocalStorageRepository.isDarkMode();
  }

}