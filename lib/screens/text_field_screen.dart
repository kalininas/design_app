import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:design_vkr/widgets/design_widgets/custom_text_field.dart';
import 'package:design_vkr/widgets/sub_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SubHeaderText("Обычное текстовое поле:"),
                const SizedBox(
                  height: verticalPadding,
                ),
                CustomColorTween(
                  bloc: context.read<ColorBloc>(),
                  builder: (color) => CustomTextField(
                    color: color,
                  ),
                ),
                const SizedBox(
                  height: verticalPadding,
                ),
                const SubHeaderText("Выключенное текстовое поле:"),
                const SizedBox(
                  height: verticalPadding,
                ),
                const CustomTextField(
                  initialValue: "Hello, world!!!",
                  enabled: false,
                ),
                const SizedBox(
                  height: verticalPadding,
                ),
                const SubHeaderText("Текстовое поле с ошибкой:"),
                const SizedBox(
                  height: verticalPadding,
                ),
                const CustomTextField(
                  error: "*Поле не должно содержать больше 20 символов",
                ),
                const SizedBox(
                  height: verticalPadding,
                ),
                ColorRow(
                  bloc: context.read<ColorBloc>(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
