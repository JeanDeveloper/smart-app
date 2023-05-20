import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class DeleteData {

  final ILocalStorageRepository iLocalStorageRepository;
  DeleteData(this.iLocalStorageRepository);

  Future<bool> call() async {
    return await iLocalStorageRepository.clearAllData();
  }

}