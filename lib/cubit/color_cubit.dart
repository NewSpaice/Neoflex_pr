import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cubit_state.dart';

class ColorCubit extends Cubit<CubitColorState>{
  ColorCubit() : super(const ColorInitalState());

  void newColor(Color color){
    emit(ColorCurrentState(color));
  }
  void newRandomColor(){
    emit(ColorCurrentState(Color(Random().nextInt(0xffffffff))));
  }
  void resetColor(){
    emit(const ColorInitalState());
  }
}