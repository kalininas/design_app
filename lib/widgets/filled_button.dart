import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    required this.backgroundColor,
    this.isDisabled = false,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final Color backgroundColor;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDisabled ? lightColor : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CustomTextButton(
        color: secondaryColor,
        label: label,
        onPressed: isDisabled ? null : onPressed,
      ),
    );
  }
}
