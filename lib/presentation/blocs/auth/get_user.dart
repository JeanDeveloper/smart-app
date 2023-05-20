import 'package:smart/domain/entities/user.dart';
import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class GetUserStorage{

  final ILocalStorageRepository iLocalStorageRepository;
  GetUserStorage(this.iLocalStorageRepository);

  Future<User> call() async {
    final user = await iLocalStorageRepository.getUser();
    return user;
  }

}