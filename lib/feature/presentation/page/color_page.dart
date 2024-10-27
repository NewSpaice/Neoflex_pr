
import 'package:clean_arch/feature/presentation/cubit/color_cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(child: BlocBuilder<ColorCubit, ColorState>(
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
                      Navigator.of(context).pushNamed('/second');
                    }, 
                    child: const Text('Second page'))
                ],
              ),
            ),
            ColorPicker(
              color: state.color,
              onColorChanged: (color){
              context.read<ColorCubit>().setColor(color);
            }),
            ]);
          },
        )),
      ),
    );
  }
}