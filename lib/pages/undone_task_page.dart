import 'dart:io';

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
            widget.undoneTaskList[index].isDone =
                !widget.undoneTaskList[index].isDone;
            widget.doneTaskList.add(widget.undoneTaskList[index]);
            widget.undoneTaskList.removeAt(index);
            setState(() {});
          },
          secondary: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('編集'),
                          leading: Icon(Icons.edit),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('削除'),
                          leading: Icon(Icons.delete),
                          onTap: () {},
                        ),
                      ],
                    );
                  });
            },
          ),
        );
      },
      itemCount: widget.undoneTaskList.length,
    );
  }
}
