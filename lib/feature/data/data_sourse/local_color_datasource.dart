import 'package:clean_arch/feature/domain/entity/color_failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalColorDataSource {
  Future<Either<ColorFailure, String>> write(String color);
  Future<Either<ColorFailure, String>> read();
}