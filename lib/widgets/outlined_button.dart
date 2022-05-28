import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.borderColor,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final Color borderColor;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: borderColor, width: 3.0),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CustomTextButton(
        label: label,
        onPressed: onPressed,
        color: borderColor,
      ),
    );
  }
}
