
import 'package:clean_arch/core/use_case/failure/failure.dart';
import 'package:clean_arch/core/use_case/use_case.dart';
import 'package:clean_arch/feature/domain/entity/color_entity.dart';
import 'package:clean_arch/feature/domain/entity/color_failure.dart';
import 'package:clean_arch/feature/domain/repository/color_repository.dart';
import 'package:dartz/dartz.dart';

class GetColorUseCase implements UseCaseNoParams<ColorEntity>{
  final ColorRepository colorRepository;
  GetColorUseCase({required this.colorRepository});
  @override
  Future<Either<ColorFailure, ColorEntity>> call() {
    return colorRepository.read();
  }

}

