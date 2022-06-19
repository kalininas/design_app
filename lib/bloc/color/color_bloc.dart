import 'package:design_vkr/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorState(primaryColor1, primaryColor1)) {
    on<ColorChanged>(
        (event, emit) => emit(ColorState(state.curColor, event.nextColor)));
  }
}
