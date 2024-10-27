import 'package:clean_arch/feature/data/data_sourse/local_color_datasource.dart';
import 'package:clean_arch/feature/domain/entity/color_entity.dart';
import 'package:clean_arch/feature/domain/entity/color_failure.dart';
import 'package:clean_arch/feature/domain/repository/color_repository.dart';
import 'package:dartz/dartz.dart';


class ColorRepositoryImpl implements ColorRepository{
  final LocalColorDataSource _localColorDatasource;
  
  ColorRepositoryImpl({required LocalColorDataSource localColorDatasource})
    :_localColorDatasource = localColorDatasource;

  @override
  Future<Either<ColorFailure, ColorEntity>> read() async{
   final result = await _localColorDatasource.read();
   return result.fold((failure) => Left(failure), (color) => Right(ColorEntity(color:color)));
  }

  @override
  Future<Either<ColorFailure, ColorEntity>> write(ColorEntity color) async {
    final result = await _localColorDatasource.write(color.color);
   return result.fold((failure) => Left(failure), (color) => Right(ColorEntity(color:color)));
  }

}