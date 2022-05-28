import 'package:design_vkr/utils/constants.dart';
import 'package:flutter/material.dart';

enum RadioValue { turnOn, turnOff }

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.isChecked,
    this.onChanged,
    this.color = primaryColor1,
  }) : super(key: key);

  final Color color;
  final bool isChecked;
  final void Function(RadioValue? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: isChecked ? RadioValue.turnOn : RadioValue.turnOff,
      groupValue: RadioValue.turnOn,
      onChanged: onChanged,
      activeColor: color,
    );
  }
}
