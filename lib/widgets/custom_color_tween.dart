import 'package:design_vkr/bloc/color/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomColorTween extends StatelessWidget {
  const CustomColorTween({
    Key? key,
    required this.bloc,
    required this.builder,
  }) : super(key: key);

  final ColorBloc bloc;
  final Widget Function(Color color) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      bloc: bloc,
      builder: (context, state) {
        return TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: state.prevColor, end: state.curColor),
          duration: const Duration(milliseconds: 750),
          builder: (_, color, __) {
            return builder(color!);
          },
        );
      },
    );
  }
}
