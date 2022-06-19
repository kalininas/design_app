import 'package:design_vkr/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.enabled = true,
    this.error,
    this.color = primaryColor3,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.obscured = false,
  }) : super(key: key);

  final bool enabled;
  final Color color;
  final String? initialValue;
  final String? error;
  final bool obscured;
  final String? hintText;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _outlineInputBorderTemplate = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius,
      ),
    );

    const BorderSide _borderSideTemplate = BorderSide(
      width: borderWidth,
    );

    final OutlineInputBorder focusedBorder = _outlineInputBorderTemplate
        .copyWith(borderSide: _borderSideTemplate.copyWith(color: color));

    final OutlineInputBorder errorBorder = _outlineInputBorderTemplate.copyWith(
      borderSide: _borderSideTemplate.copyWith(
        color: errorColor,
      ),
    );

    final OutlineInputBorder border = _outlineInputBorderTemplate.copyWith(
        borderSide: _borderSideTemplate.copyWith(color: color));

    final OutlineInputBorder disabledBorder =
        _outlineInputBorderTemplate.copyWith(
      borderSide: _borderSideTemplate.copyWith(
        color: lightColor,
      ),
    );

    final OutlineInputBorder enabledBorder =
        _outlineInputBorderTemplate.copyWith(
      borderSide: _borderSideTemplate.copyWith(
        color: secondaryColor,
      ),
    );

    return TextFormField(
      enabled: enabled,
      cursorColor: color,
      onChanged: onChanged,
      initialValue: initialValue,
      obscureText: obscured,
      decoration: InputDecoration(
        fillColor: secondaryColor,
        filled: true,
        errorText: error,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        border: border,
        labelText: hintText,
        labelStyle: TextStyle(
          color: error == null || error!.isEmpty ? color : errorColor,
        ),
        disabledBorder: disabledBorder,
        enabledBorder: enabledBorder,
      ),
    );
  }
}
