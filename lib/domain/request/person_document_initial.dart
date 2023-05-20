import 'package:smart/domain/request/person_request.dart';

class PersonDocumentInitialRequest{

  final int codDetPerson;
  final String username;
  final CourseStateRequest courseState;

  PersonDocumentInitialRequest(this.codDetPerson, this.username, this.courseState);
  

}