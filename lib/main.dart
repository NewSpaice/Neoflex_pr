import 'package:flutter/material.dart';
import 'package:l7/Page.dart';


void main() {
  runApp(const MaterialApp(
    home: WorkPage(),
  ));
}


class Person extends StatefulWidget {
 
  @override
  _PersonState createState() => _PersonState();
}
class _PersonState extends State<Person>{
 
  String _name = "Tom";
  final _controller = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    _controller.text = _name;
    print(1);
    _controller.addListener((){
      _changeName();
});
  }

  void _changeName(){
    setState(() =>_name = _controller.text);
    print(2);
  }
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Text("Имя пользователя: $_name", style: TextStyle(fontSize: 22)),
      TextField(
          style: TextStyle(fontSize: 22),
          controller: _controller)
    ])
    );
  }
}