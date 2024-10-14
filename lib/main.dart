import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home>{
  late List<StatefullColorTile> tiles;

  @override
  void initState(){
    super.initState();
    tiles = <StatefullColorTile>[
      StatefullColorTile(
        key: UniqueKey(),
      ),
      StatefullColorTile(
         key: UniqueKey(),
      )
    ];
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swap,
        child: const Icon(Icons.switch_access_shortcut,)),
    );
  }
  void swap(){
    setState(() {
      tiles.add(tiles.removeAt(0));
    });
  }
}
class StatefullColorTile extends StatefulWidget{
  const StatefullColorTile({super.key});
  @override
  State<StatefullColorTile> createState() => _StatefullColorTile();
}

class _StatefullColorTile extends State<StatefullColorTile>{
  late Color color;
  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
  @override
  Widget build(BuildContext context){
    return Container(width: 200,height: 200,color: color,);
  }
}