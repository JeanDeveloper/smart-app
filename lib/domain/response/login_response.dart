import 'package:equatable/equatable.dart';
import 'package:smart/domain/entities/user.dart';

class LoginResponse extends Equatable{

  LoginResponse({
    required this.status,
    required this.token,
    required this.message,
    required this.user,
  });

  int status;
  String token;
  String message;
  User user;

  @override
  List<Object?> get props => [
    status, 
    token,
    message,
    user
  ];

}
