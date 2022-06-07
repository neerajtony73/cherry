part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}


class EmailChanged extends SignUpEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'Email Changed {Email : $email}';
}

class PasswordChanged extends SignUpEvent {
  final String password;

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'Password Changed {Password : $password}';
}

class Submitted extends SignUpEvent{
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
class SignUpWithCredentialsIsPressed extends SignUpEvent{
  final String email;
  final String password;

  SignUpWithCredentialsIsPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
