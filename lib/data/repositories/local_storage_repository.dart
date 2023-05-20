import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart/data/datasources/local_storage_datasource.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:smart/domain/repositories/ilocal_storage_repository.dart';

class LocalStorageRepository extends ILocalStorageRepository{

  final ILocalStorageDataSource localStorageDataSource;
  LocalStorageRepository(this.localStorageDataSource);

  final _token      = "token";
  final _code       = "code";
  final _darkTheme  = "dark-theme";

  @override
  Future<User> saveUser(User user)  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(_code, user.codigo);
    return user;
  }

  @override
  Future<bool> clearAllData()  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final state = preferences.clear();
    return state;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString( _token );
    return token ?? '';
  }

  @override
  Future<User> getUser() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    int userCode = preferences.getInt(_code)?? 0;
    final user = await localStorageDataSource.getUser(userCode);

    // final user = User(
    //   codigo: preferences.getInt(_code) ?? 0,
    //   userName: preferences.getString(_username) ?? '',
    //   nombres: preferences.getString(_name) ?? '', 
    //   apellidos: preferences.getString(_surname) ?? '',
    //   nroDoc: preferences.getString(_document) ?? '',
    //   email: preferences.getString(_email) ?? '',
    //   telefono: preferences.getString(_telefono) ?? '',
    //   tipoUsuario: preferences.getString(_tipoUsuario) ?? '',
    //   codCliente: preferences.getString(_codCliente) ?? '',
    //   codEmpresa: preferences.getInt(_codEmpresa) ?? 0,
    //   codPersonal: preferences.getInt(_codPersonal) ?? 0,
    // );

    return user;
  }

  @override
  Future<bool> isDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final dark = preferences.getBool(_darkTheme);
    return dark ?? false; 
  }

  @override
  Future<bool> saveDarkMode(bool darkMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final state = preferences.setBool(_darkTheme, darkMode);
    return state ;
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_token, token);
    return token;
  }


}