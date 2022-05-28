part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {}

class ColorChanged extends ColorEvent {
  final Color _nextColor;

  ColorChanged(this._nextColor);

  Color get nextColor => _nextColor;

  @override
  List<Object?> get props => [_nextColor];
}
