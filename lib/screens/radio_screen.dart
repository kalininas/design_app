import 'package:design_vkr/bloc/color/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/utils/text_styles.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:design_vkr/widgets/design_widgets/custom_checkbox.dart';
import 'package:design_vkr/widgets/design_widgets/custom_radio_button.dart';
import 'package:design_vkr/widgets/design_widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildRadioColumn(context),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: Divider(),
              ),
              buildCheckboxColumn(context),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: Divider(),
              ),
              buildSwithColumn(context),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: Divider(),
              ),
              ColorRow(bloc: context.read<ColorBloc>()),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSwithColumn(BuildContext context) {
    return Column(
      children: [
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) => buildRowWithText(
            child: CustomSwitchButton(
              isChecked: true,
              onChanged: (value) {},
              color: color,
            ),
            text: "??????????????????",
          ),
        ),
        const SizedBox(
          height: verticalPadding,
        ),
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) => buildRowWithText(
            child: CustomSwitchButton(
              isChecked: false,
              onChanged: (value) {},
              color: color,
            ),
            text: "???? ??????????????????",
          ),
        ),
      ],
    );
  }

  Column buildCheckboxColumn(BuildContext context) {
    return Column(
      children: [
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) => buildRowWithText(
            child: Transform.scale(
              scale: 2.0,
              child: CustomCheckbox(
                isChecked: true,
                onChanged: (value) {},
                color: color,
              ),
            ),
            text: "??????????????????",
          ),
        ),
        const SizedBox(
          height: verticalPadding,
        ),
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) => buildRowWithText(
            child: Transform.scale(
              scale: 2.0,
              child: CustomCheckbox(
                isChecked: false,
                onChanged: (value) {},
                color: color,
              ),
            ),
            text: "???? ??????????????????",
          ),
        ),
      ],
    );
  }

  Column buildRadioColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) {
            return buildRowWithText(
              text: "??????????????????",
              child: Transform.scale(
                scale: 2.0,
                child: CustomRadioButton(
                  isChecked: true,
                  onChanged: (value) {},
                  color: color,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: verticalPadding,
        ),
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) {
            return buildRowWithText(
              child: Transform.scale(
                scale: 2.0,
                child: CustomRadioButton(
                  isChecked: false,
                  onChanged: (value) {},
                  color: color,
                ),
              ),
              text: "???? ??????????????????",
            );
          },
        ),
      ],
    );
  }

  Row buildRowWithText({required Widget child, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        child,
        Text(
          text,
          style: subHeaderStyle,
        ),
      ],
    );
  }
}
