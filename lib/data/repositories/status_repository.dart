import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/data/datasources/status_datasource.dart';
import 'package:smart/domain/repositories/istatus_repository.dart';
import 'package:smart/domain/request/observation_request.dart';

class StatusRepository extends IStatusRepository{

  final IStatusDataSource statusDataSource;
  StatusRepository(this.statusDataSource);

  @override
  Future<int> registerStatus(RegisterStatusRequest request) async {

    try {
      final registerResponse = await statusDataSource.registerStatus(request);
      return registerResponse;
    } on ServerException {
      return Future.error(1) ;
    }
  }

}