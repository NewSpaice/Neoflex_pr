import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkPage extends StatefulWidget{

  const WorkPage({super.key});

  @override
  PageState createState() => PageState(); 
}

class PageState extends State<WorkPage>{
  
String? selectedValue = '1';  
final _formKey = GlobalKey<FormState>();
late FocusNode myFocusNode;


@override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  void _showAlertDialog(BuildContext context, String data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nice c...!"),
          content: Text(data),
          actions: <Widget>[
            TextButton(
              child: const Text("ОК"),
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем диалог
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
          _showAlertDialog(context, 'If you tapped this, ok u cryptoman');
      },
      child: Scaffold(
        appBar: AppBar(
        title: Text('Text form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: myFocusNode,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9а-я-=+*/]'))
              ],
              decoration: const InputDecoration(
                labelText: 'Введите текст',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value){
                if (value == null || value.isEmpty){
                  return 'Не должно быть пусто в поле';
                }
                return null;
              },
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent,
                ),
                dropdownColor: Colors.blueAccent,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: const <DropdownMenuItem<String>> [
                DropdownMenuItem(child: Text('Элемент 1'), value: '1'),
                DropdownMenuItem(child: Text('Элемент 2'), value: '2'),
                DropdownMenuItem(child: Text('Элемент 3'), value: '3'),
              ]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                myFocusNode.requestFocus();
                 if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Данные обрабатываются')),
                    );
                    _showAlertDialog(context, 'Форма отправлена!');
                  }
              },
              child: const Text('Отправить')
              ),
          ],
        )
        )
        ),
      )
    );
    
  }
}