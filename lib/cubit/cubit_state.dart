part of 'color_cubit.dart';


sealed class CubitColorState extends Equatable{
  final Color color;

  const CubitColorState(this.color);

  @override
  List<Object> get props => [color];
}
final class ColorInitalState extends CubitColorState{
  const ColorInitalState() : super(Colors.blue);
}
final class ColorCurrentState extends CubitColorState{
  const ColorCurrentState(super.color);
}