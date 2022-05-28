import 'package:design_vkr/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SubHeaderText extends StatelessWidget {
  const SubHeaderText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: subHeaderStyle,
    );
  }
}
