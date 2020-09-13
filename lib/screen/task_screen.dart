import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoy/screen/add_tasks.dart';
import 'task_list.dart';
import 'add_tasks.dart';
import 'package:todoy/models/task.dart';
import 'task_tile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class TaskScreen extends StatefulWidget {

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  void addNewItem(String item){
    tasks.add(Task(name: item));
  }
 void delTask(int index){
    tasks.removeAt(index);
 }
  List <Task> tasks=[
    Task(name: 'Buy Milk'),
    Task(name: 'ATM'),
    Task(name: 'Shopping'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60,left: 30,bottom: 30,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(

                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    )
                ),
                Text('Todo List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),

                ),
                Text(
                  '${tasks.length} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
              ),
//              child:TaskList(tasks),
            child: ListView.builder(itemBuilder: (context,index){
              return TaskTile(title:tasks[index].name ,isChecked: tasks[index].isDone,longpress:(){
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "Delete Task",
                  desc: "Are you sure you want to Delete?",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: (){
                        setState(() {
                          tasks.removeAt(index);
                        });
                        Navigator.pop(context);
                      } ,
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();

              },cbCall:(bool cbState){
                setState(() {
                  tasks[index].toggleDone();
                });

              },

              );
            },
              itemCount: tasks.length,
            ),
            )
            ,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=>AddTasks((newTask){
            setState(() {
              tasks.add(Task(name: newTask));
            });
            Navigator.pop(context);
          }));

        },
      ),
    );
  }
}
