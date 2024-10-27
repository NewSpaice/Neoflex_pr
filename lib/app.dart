import 'package:filework/db.dart';
import 'package:filework/dog_class.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Dog Walker = Dog(id: 1, name: 'Walker', age: 27);
  Dog Axe = Dog(id: 2, name: 'Axe', age: 777);
  Dog Seat = Dog(id: 3, name: 'Seat', age: 16);
  Dog Svinka = Dog(id: 3, name: 'Svinka', age: 12);
  await insertDog(Walker);
  await insertDog(Axe);
  await insertDog(Seat);
  await insertDog(Svinka);
  List<Dog> all = await getAllDogs();
  for(var dog in all){
    print(dog.getInfo());
  }
  await deleteDog(1);
  all = await getAllDogs();
  for(var dog in all){
    print(dog.getInfo());
  }
}