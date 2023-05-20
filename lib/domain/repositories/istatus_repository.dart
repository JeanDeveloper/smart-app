import 'package:smart/domain/request/observation_request.dart';

abstract class IStatusRepository{

  Future<int>registerStatus(RegisterStatusRequest request );

}