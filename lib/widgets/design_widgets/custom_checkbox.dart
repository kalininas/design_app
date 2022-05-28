import 'package:design_vkr/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    this.color = primaryColor1,
    this.onChanged,
  }) : super(key: key);

  final Color color;
  final bool isChecked;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {},
      activeColor: color,
    );
  }
}
