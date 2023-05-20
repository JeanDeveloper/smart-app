
import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';

abstract class IMessageRepository{
  Future<Either<Failure, int >>sendMsgWsp(String codeEncrypt, String documentName, int messageType, String createdBy);
}