import 'package:clean_arch/feature/data/color_repository_impl.dart';
import 'package:clean_arch/feature/data/data_sourse/file_local_datasource.dart';
import 'package:clean_arch/feature/data/data_sourse/local_color_datasource.dart';
import 'package:clean_arch/feature/domain/get_color_use_case.dart';
import 'package:clean_arch/feature/domain/repository/color_repository.dart';
import 'package:clean_arch/feature/domain/select_color_use_case.dart';
import 'package:clean_arch/feature/presentation/cubit/color_cubit.dart';
import 'package:get_it/get_it.dart';

void configureDependencies(){
  GetIt.I.registerFactory<LocalColorDataSource>(()=>FileColorDataSource());
  GetIt.I.registerFactory<ColorRepository>(()=>ColorRepositoryImpl(localColorDatasource: GetIt.I()));
   GetIt.I.registerFactory(()=>GetColorUseCase(colorRepository: GetIt.I()));
   GetIt.I.registerFactory(()=>SelectColorUseCase(colorRepository: GetIt.I()));
   GetIt.I.registerLazySingleton<ColorCubit>(()=>ColorCubit(GetIt.I(),GetIt.I()));
}