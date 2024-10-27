import 'package:clean_arch/di/conf.dart';
import 'package:clean_arch/feature/presentation/cubit/color_cubit.dart';
import 'package:clean_arch/feature/presentation/page/color_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return BlocProvider<ColorCubit>.value(
  value: GetIt.I(),
  child: MaterialApp(
    routes: {
      '/':(context) => const CubitPage(),
      '/second':(context) => const CubitPage(),
    },
    ),
  );
  }
}

