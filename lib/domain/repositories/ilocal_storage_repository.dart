import 'package:smart/domain/entities/user.dart';

abstract class ILocalStorageRepository{
  Future<String> saveToken( String token );
  Future<User>   saveUser(User user);
  Future<bool>   saveDarkMode(bool darkMode);
  Future<String> getToken();
  Future<User>   getUser();
  Future<bool>   isDarkMode();
  Future<bool>   clearAllData();
}