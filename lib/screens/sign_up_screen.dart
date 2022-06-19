import 'package:design_vkr/bloc/color/color_bloc.dart';
import 'package:design_vkr/bloc/sign_up/sign_up_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:design_vkr/widgets/design_widgets/custom_checkbox.dart';
import 'package:design_vkr/widgets/design_widgets/custom_switch_button.dart';
import 'package:design_vkr/widgets/design_widgets/custom_text_field.dart';
import 'package:design_vkr/widgets/design_widgets/flat_button.dart';
import 'package:design_vkr/widgets/sub_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColorTween(
      bloc: context.read<ColorBloc>(),
      builder: (color) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            "Регистрация",
            style: TextStyle(color: secondaryColor),
          ),
          backgroundColor: color,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) => CustomTextField(
                            hintText: "Логин",
                            color: color,
                            onChanged: (value) => context
                                .read<SignUpBloc>()
                                .add(LoginChanged(value)),
                            error: state.loginError,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) => CustomTextField(
                            color: color,
                            hintText: "Пароль",
                            obscured: state.obscured,
                            onChanged: (value) => context
                                .read<SignUpBloc>()
                                .add(PasswordChanged(value)),
                            error: state.passwordError,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        const SubHeaderText("Выберите тип пользователя"),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) => _RowWithSwitch(
                            title: "Я студент",
                            isChecked: !state.isTeacher,
                            color: color,
                            onChanged: (value) => context
                                .read<SignUpBloc>()
                                .add(UserTypeChanged(!value)),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) => _RowWithSwitch(
                            title: "Я преподаватель",
                            isChecked: state.isTeacher,
                            color: color,
                            onChanged: (value) => context
                                .read<SignUpBloc>()
                                .add(UserTypeChanged(value)),
                          ),
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        const SubHeaderText("Политика конфиденциальности"),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) => CustomCheckbox(
                                isChecked: state.isPrivacyPolicyAgreed,
                                onChanged: (value) => context
                                    .read<SignUpBloc>()
                                    .add(PrivacyPolicyAgreed()),
                              ),
                            ),
                            Text(
                              "Согласен с политикой конфиденциальности",
                              style: TextStyle(color: color),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) => CustomFlatButton(
                            backgroundColor: color,
                            label: "Зарегистрироваться",
                            isDisabled: state.login.isNotEmpty &&
                                state.loginError != null &&
                                state.password.isNotEmpty &&
                                state.passwordError != null,
                          ),
                        ),
                        const SizedBox(
                          height: verticalPadding,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ColorRow(bloc: context.read<ColorBloc>())
            ],
          ),
        ),
      ),
    );
  }
}

class _RowWithSwitch extends StatelessWidget {
  const _RowWithSwitch({
    Key? key,
    required this.title,
    required this.color,
    this.isChecked = false,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final bool isChecked;
  final Color color;
  final Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: color),
        ),
        CustomSwitchButton(
          isChecked: isChecked,
          onChanged: onChanged,
          color: color,
        ),
      ],
    );
  }
}
