import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.color,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final Color color;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Text(
          label ?? "КНОПКА",
          style: keyWordStyle.copyWith(color: color),
        ),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
