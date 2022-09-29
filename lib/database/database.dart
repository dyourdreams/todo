import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];
  //ref our box
  final _myBox = Hive.box('myBox');

  //create initial data
  void createInitialData(){toDoList = [
      ['Eat',false],
      ['Sleep',false]
     ];
  }

  //load data from database
  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  //update database
  void updateDataBase(){
    _myBox.put('TODOLIST', toDoList);
  }

}