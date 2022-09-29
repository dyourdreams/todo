import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/mystyles.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

    ToDoList({Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 20,right: 20,bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: deleteTask,
              backgroundColor: Colors.red.shade200,
              icon: Icons.delete,
            )
          ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade200
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:[
                Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.red,),
                SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: SelectableText(taskName,style: taskCompleted?Style.headLineStyle2:Style.headLineStyle1,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}