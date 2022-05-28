import 'package:design_vkr/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({
    Key? key,
    required this.isChecked,
    this.color = primaryColor3,
    this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final Color? color;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isChecked,
      onChanged: onChanged,
      activeColor: isChecked ? color : secondaryColor,
      thumbColor: isChecked ? secondaryColor : color,
      trackColor: secondaryColor,
    );
  }
}
