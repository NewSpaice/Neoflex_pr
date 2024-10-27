import 'package:filework/dog_class.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> get DataBase async{
  final dbpath = await getDatabasesPath();
  final path = join(dbpath,'doggie_database.db');

  return openDatabase(
    path,
    onCreate: (db, version){
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1
    );
}

Future<void> insertDog(Dog dog) async{
  final db = await DataBase;

  await db.insert(
    'dogs',
     dog.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace,
     );
}

Future<List<Dog>> getAllDogs() async{
  final db = await DataBase;

  final List<Map<String, dynamic>> map = await db.query('dogs');

  return List.generate(map.length, (i){
    return Dog(
      id: map[i]['id'],
      name: map[i]['name'],
      age: map[i]['age']
    );
  });
}

Future<void> deleteDog(int id) async{
  final db = await DataBase;

  await db.delete(
    'dogs',
    where: 'id = ?',
    whereArgs: [id]
  );
}