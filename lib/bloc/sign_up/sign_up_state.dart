part of "./sign_up_bloc.dart";

class SignUpState extends Equatable {
  final String login;
  final String password;
  final bool obscured;
  final bool isTeacher;
  final bool isPrivacyPolicyAgreed;

  String? get loginError {
    if (login.isNotEmpty && login.length < 6) {
      return "Минимальный размер поля - 6 символов";
    } else if (RegExp("^[a-zA-Z0-9]").hasMatch(login)) {
      return "Поле содержит недопустимые символы";
    } else {
      return null;
    }
  }

  String? get passwordError {
    if (password.isNotEmpty && password.length < 6) {
      return "Минимальный размер поля - 8 символов";
    } else if (RegExp("^[a-zA-Z0-9-_:;]").hasMatch(password)) {
      return "Поле содержит недопустимые символы";
    } else {
      return null;
    }
  }

  const SignUpState({
    this.login = "",
    this.password = "",
    this.obscured = true,
    this.isTeacher = false,
    this.isPrivacyPolicyAgreed = false,
  });

  SignUpState copyWith({
    String? login,
    String? password,
    bool? obscured,
    bool? isTeacher,
    bool? isPrivacyPolicyAgreed,
  }) =>
      SignUpState(
        login: login ?? this.login,
        password: password ?? this.password,
        obscured: obscured ?? this.obscured,
        isTeacher: isTeacher ?? this.isTeacher,
        isPrivacyPolicyAgreed:
            isPrivacyPolicyAgreed ?? this.isPrivacyPolicyAgreed,
      );

  @override
  List<Object?> get props => [
        login,
        password,
        obscured,
        isTeacher,
        isPrivacyPolicyAgreed,
      ];
}
