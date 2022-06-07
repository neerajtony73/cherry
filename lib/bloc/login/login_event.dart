part of 'login_bloc.dart';


@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'Email Changed {Email : $email}';
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'Password Changed {Password : $password}';
}

class Submitted extends LoginEvent{
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
class LoginWithCredentialsIsPressed extends LoginEvent{
  final String email;
  final String password;

  LoginWithCredentialsIsPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}