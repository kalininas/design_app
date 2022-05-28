import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:flutter/material.dart';

class ColorRow extends StatelessWidget {
  const ColorRow({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ColorBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: primaryColors
          .map(
            (e) => GestureDetector(
              onTap: () => bloc.add(ColorChanged(e)),
              child: Container(
                width: MediaQuery.of(context).size.width / 7.0,
                height: MediaQuery.of(context).size.width / 7.0,
                color: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
