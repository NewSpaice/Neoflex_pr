
import 'package:clean_arch/core/use_case/failure/failure.dart';
import 'package:clean_arch/core/use_case/use_case.dart';
import 'package:clean_arch/feature/domain/entity/color_entity.dart';
import 'package:clean_arch/feature/domain/entity/color_failure.dart';
import 'package:clean_arch/feature/domain/repository/color_repository.dart';
import 'package:dartz/dartz.dart';

class SelectColorUseCase extends UseCase<ColorEntity, ColorEntity>{
  final ColorRepository colorRepository;
  SelectColorUseCase({required this.colorRepository});
  @override
  Future<Either<ColorFailure, ColorEntity>> call(ColorEntity params) {
    return colorRepository.write(params);
  }

}