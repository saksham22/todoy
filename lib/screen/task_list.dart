import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoy/models/task.dart';
class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return TaskTile(title:widget.tasks[index].name ,isChecked: widget.tasks[index].isDone,cbCall:(bool cbState){
        setState(() {
          widget.tasks[index].toggleDone();
        });
      });
    },
      itemCount: widget.tasks.length,
//      children: <Widget>[
//        TaskTile(title: tasks[0].name,isChecked: tasks[0].isDone,),
//        TaskTile(title: tasks[1].name,isChecked: tasks[1].isDone,),
//        TaskTile(title: tasks[2].name,isChecked: tasks[2].isDone,),
//      ],
    );
  }
}
