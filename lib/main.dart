import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await writeData('ДА ДА');
  String data = await readData();
  print(data);
  print('***************');

  await saveData();
  await readDataShared();
  await deleteData();
  print('***************');
  await readDataShared();
  
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}


Future<File> writeData(String data) async {
  final file = await _localFile;
  // Write the file
  return file.writeAsString(data);
}

Future<String> readData() async {
  try {
    final file = await _localFile;

    final contents = await file.readAsString();

    return contents;
  } catch (e) 
  {
    return '';
  }
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.setString('username', 'Dante');
  await prefs.setInt('age', 237);
  await prefs.setBool('isLogged', true);
}

Future<void> readDataShared() async{

  final prefs = await SharedPreferences.getInstance();

  String? username = prefs.getString('username');
  int? age = prefs.getInt('age');
  bool? isLogged = prefs.getBool('isLogged');

  print('Username $username; age $age; Online $isLogged');
}

Future<void> deleteData() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('age');
}