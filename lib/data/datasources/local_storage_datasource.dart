import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/user_model.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class ILocalStorageDataSource{
  Future<User> getUser(int userCode);
}

class LocalStorageDataSource extends ILocalStorageDataSource{

  final http.Client client;

  LocalStorageDataSource(this.client);

  @override
  Future<User> getUser(int userCode) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/auth/user/',
      {
        "codeUser": userCode.toString(),
      }
    );

    final resp =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if( resp.statusCode == 200  ){
      return userModelFromJson(resp.body);
    } 
    else {
      throw ServerException();
    }
  }

}
