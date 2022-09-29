import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database/database.dart';
import 'package:todo/mystyles.dart';
import 'package:todo/utl/dialog_box.dart';
import 'package:todo/utl/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //ref hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

 @override
  void initState() {
    //first time open app
    if(_myBox.get('TODOLIST') == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }


  //text controller
  final _controller = TextEditingController();



  // //List of tasks
  // List toDoList = [
  //   ["Code",true],
  //   ['Read',false],
  //   ['Sleep',false],
    
  // ];

  //checkbox tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //create new task
  void newTask(){
    showDialog(context: context, builder: (context){
     return DialogBoxScreen(
      controller: _controller,
      onCanceled:()=>Navigator.of(context).pop(),
      onSaved: saveNewTask,
      );
    });
  }
  //save new task
  void saveNewTask(){
    setState(() {
      if(_controller.text.isNotEmpty){
        db.toDoList.add([_controller.text,false]);
      _controller.clear();
      }
      
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  //delete task
  void deleteFunction(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Style.bgColor,
        elevation: 0,
        title: Center(child: Text('To Do List',style: Style.headLineStyle1,)),
      ),

      //Add Button
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        tooltip: 'Add task',
        backgroundColor: Style.bgColor,
        child: Icon(Icons.add,color: Colors.grey[700],size: 40,),
        ),

      //Task View
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoList(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteTask: (context)=> deleteFunction(index),
            );
            
        }
        ),
      
    );
  }
}