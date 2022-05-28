import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:design_vkr/widgets/design_widgets/flat_button.dart';
import 'package:design_vkr/widgets/design_widgets/outlined_button.dart';
import 'package:design_vkr/widgets/sub_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SubHeaderText("Плоская кнопка: "),
              const SizedBox(
                height: verticalPadding,
              ),
              CustomColorTween(
                bloc: context.read<ColorBloc>(),
                builder: (color) => Padding(
                  padding: const EdgeInsets.only(bottom: verticalPadding),
                  child: CustomFlatButton(
                    backgroundColor: color,
                  ),
                ),
              ),
              const SubHeaderText("Контурная кнопка: "),
              const SizedBox(
                height: verticalPadding,
              ),
              CustomColorTween(
                bloc: context.read<ColorBloc>(),
                builder: (color) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: verticalPadding,
                  ),
                  child: CustomOutlinedButton(
                    borderColor: color,
                  ),
                ),
              ),
              const SubHeaderText("Выключенная кнопка: "),
              const SizedBox(
                height: verticalPadding,
              ),
              const CustomFlatButton(
                backgroundColor: Colors.red,
                isDisabled: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: verticalPadding,
                ),
                child: ColorRow(
                  bloc: context.read<ColorBloc>(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
