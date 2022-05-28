import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/utils/text_styles.dart';
import 'package:design_vkr/widgets/color_row.dart';
import 'package:design_vkr/widgets/custom_color_tween.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RadioValue { turnOn, turnOff }

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  final RadioValue rv = RadioValue.turnOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: color,
            ),
            text: "ВЫБРАННЫЙ",
          ),
        ),
        const SizedBox(
          height: verticalPadding,
        ),
        CustomColorTween(
          bloc: context.read<ColorBloc>(),
          builder: (color) => buildRowWithText(
            child: CupertinoSwitch(
              value: false,
              onChanged: (value) {},
              activeColor: color,
              thumbColor: color,
            ),
            text: "НЕ ВЫБРАННЫЙ",
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
              child: Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: color,
              ),
            ),
            text: "ВЫБРАННЫЙ",
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
              child: Checkbox(
                value: false,
                onChanged: (value) {},
                activeColor: color,
              ),
            ),
            text: "НЕ ВЫБРАННЫЙ",
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
              text: "ВЫБРАННЫЙ",
              child: Transform.scale(
                scale: 2.0,
                child: Radio(
                  value: RadioValue.turnOn,
                  groupValue: rv,
                  onChanged: (value) {},
                  activeColor: color,
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
                child: Radio(
                  value: RadioValue.turnOff,
                  groupValue: rv,
                  onChanged: (value) {},
                  activeColor: color,
                ),
              ),
              text: "НЕ ВЫБРАННЫЙ",
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
