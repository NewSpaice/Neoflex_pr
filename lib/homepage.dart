import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/color_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(child: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
           return Column(
           children: [ Container(
              width: 200,
              height: 200,
              color: state.color,
              child: Column(
                children: [
                  Text(state.color.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(NewRandomColorEvent());
                      },
                      child: const Text('Change color')),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ResetColorEvent());
                      },
                      child: const Text('Reset color')),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    }, 
                    child: const Text('Second page'))
                ],
              ),
            ),
            ColorPicker(
              color: state.color,
              onColorChanged: (color){
              context.read<ColorBloc>().add(NewColorEvent(color: color));
            }),
            ]);
          },
        )),
      ),
    );
  }
}