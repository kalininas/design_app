import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part './sign_up_event.dart';
part './sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<LoginChanged>((event, emit) => emit(state.copyWith(login: event.login)));
    on<PasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<PasswordObscured>(
        (event, emit) => emit(state.copyWith(obscured: !state.obscured)));
    on<UserTypeChanged>(
        (event, emit) => emit(state.copyWith(isTeacher: event.isTeacher)));
    on<PrivacyPolicyAgreed>((event, emit) => emit(
        state.copyWith(isPrivacyPolicyAgreed: !state.isPrivacyPolicyAgreed)));
  }
}
