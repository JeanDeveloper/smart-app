import 'package:smart/domain/entities/state_course.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/person_request.dart';

class GetInductionCourseState{
  final IRequestRepository iRequestRepository;
  GetInductionCourseState(this.iRequestRepository);

  Future< CourseState? > call( String ruc, String nroDoc, String enterPrise, String codeEncrypt) async {
    final request = CourseStateRequest(ruc,nroDoc, enterPrise, codeEncrypt);
    return iRequestRepository.getInductionCourseState(request);
  }

}