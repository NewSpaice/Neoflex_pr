import 'package:clean_arch/feature/domain/entity/color_entity.dart';
import 'package:clean_arch/feature/domain/entity/color_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ColorRepository {
  Future<Either<ColorFailure,ColorEntity>> write(ColorEntity color);

  Future<Either<ColorFailure,ColorEntity>> read();
}