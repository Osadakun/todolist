import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class UndoneTaskPage extends StatefulWidget {
  final List<Task> undoneTaskList;
  final List<Task> doneTaskList;

  UndoneTaskPage({required this.undoneTaskList, required this.doneTaskList});

  @override
  _UndoneTaskPageState createState() => _UndoneTaskPageState();
}

class _UndoneTaskPageState extends State<UndoneTaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(widget.undoneTaskList[index].title),
          value: widget.undoneTaskList[index].isDone,
          onChanged: (value) {
            widget.undoneTaskList[index].isDone = !widget.undoneTaskList[index].isDone;
            widget.doneTaskList.add(widget.undoneTaskList[index]);
            widget.undoneTaskList.removeAt(index);
            setState(() {});
          },
        );
      },
      itemCount: widget.undoneTaskList.length,
    );
  }
}
