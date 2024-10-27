import 'dart:math';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitalState()) {
    on<NewColorEvent>(
      onNewColorEvent,
    );
    on<NewRandomColorEvent>(onNewRandomColorEvent);
    on<ResetColorEvent>(onResetColorEvent);
  }


void onNewColorEvent(NewColorEvent event,Emitter<ColorState> emit){
  emit(ColorCurrentState(event.color));
}

void onNewRandomColorEvent(NewRandomColorEvent event,Emitter<ColorState> emit){
  emit(ColorCurrentState(Color(Random().nextInt(0xffffffff))));
}

void onResetColorEvent(ResetColorEvent event,Emitter<ColorState> emit){
  emit(const ColorInitalState());
}
}