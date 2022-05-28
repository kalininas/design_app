import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/utils/text_styles.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:design_vkr/widgets/filled_button.dart';
import 'package:design_vkr/widgets/outlined_button.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Filled:",
                style: subHeaderStyle,
              ),
              CustomColorTween(
                bloc: context.read<ColorBloc>(),
                builder: (color) => Padding(
                  padding: const EdgeInsets.only(bottom: verticalPadding),
                  child: CustomFilledButton(
                    backgroundColor: color,
                  ),
                ),
              ),
              const Text(
                "Outlined:",
                style: subHeaderStyle,
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
              const Text(
                "Disabled:",
                style: subHeaderStyle,
              ),
              const CustomFilledButton(
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
