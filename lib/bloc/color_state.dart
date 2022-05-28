part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color _previousColor;
  final Color _currentColor;

  const ColorState(this._previousColor, this._currentColor);

  Color get prevColor => _previousColor;
  Color get curColor => _currentColor;

  @override
  List<Object?> get props => [_previousColor, _currentColor];
}
