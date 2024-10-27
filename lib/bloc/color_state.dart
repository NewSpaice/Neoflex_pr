part of 'color_bloc.dart';

sealed class ColorState extends Equatable{
  final Color color;

  const ColorState(this.color);

  @override
  List<Object> get props => [color];
}
final class ColorInitalState extends ColorState{
  const ColorInitalState() : super(Colors.blue);
}
final class ColorCurrentState extends ColorState{
  const ColorCurrentState(super.color);
}