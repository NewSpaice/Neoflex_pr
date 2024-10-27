import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/color_cubit.dart';
import 'package:homework/cubit_page.dart';
//import 'package:homework/homepage.dart';
void main() {
  runApp(BlocProvider(
  create: (context)=> ColorCubit(),
  child: MaterialApp(
    routes: {
      '/':(context) => const CubitPage(),
      '/second':(context) => const CubitPage(),
    },
    ),
  ));
}


