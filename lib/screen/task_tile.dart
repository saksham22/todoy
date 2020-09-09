import 'package:flutter/material.dart';
import 'package:todoy/models/task.dart';
class TaskTile extends StatelessWidget {
  TaskTile({this.title,this.isChecked,this.cbCall});
  final String title;
  final bool isChecked;
  final Function cbCall;
  void checkT(bool newVal){
//setState(() {
//  isChecked=newVal;
//});
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title',style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough:null),),
      trailing:Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged:cbCall,

    ),
    );
  }
}

//class TaskCheckbox extends StatelessWidget {
//  TaskCheckbox(this.isChecked,this.toggleCheck);
//  final bool isChecked;
//  final Function toggleCheck;
//  @override
//  Widget build(BuildContext context) {
//    return Checkbox(
//      activeColor: Colors.lightBlueAccent,
//      value: isChecked,
//      onChanged: toggleCheck,
//    );
//  }
//}
