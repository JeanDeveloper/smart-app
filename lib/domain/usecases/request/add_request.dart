import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/domain/response/request_response.dart';

class AddRequest{
  final IRequestRepository iRequestRepository;
  AddRequest(this.iRequestRepository);
  Future<CreateRequestResponse> call( CreateRequestRequest  request) async {
    return iRequestRepository.registerRequest(request);
  }
}

