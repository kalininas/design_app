part of "./sign_up_bloc.dart";

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginChanged extends SignUpEvent {
  final String login;

  LoginChanged(this.login);

  @override
  List<Object?> get props => [login];
}

class PasswordChanged extends SignUpEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class PasswordObscured extends SignUpEvent {}

class UserTypeChanged extends SignUpEvent {
  final bool isTeacher;

  UserTypeChanged(this.isTeacher);

  @override
  List<Object?> get props => [isTeacher];
}

class PrivacyPolicyAgreed extends SignUpEvent {}
