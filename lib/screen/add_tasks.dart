import 'package:flutter/material.dart';
import 'task_screen.dart';
class AddTasks extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  final Function addTask;
  AddTasks(this.addTask);
  String tString;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15,left: 35,right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.lightBlueAccent,


              ),),
              TextField(
                controller: controller,
              autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value){
                tString=value;
                },
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                child: Text('Add',style: TextStyle(color: Colors.white),),
                onPressed: (){
//                  print (tString);
                  if(tString!=null) {
                    addTask(tString);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
