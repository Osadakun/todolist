import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class DoneTaskPage extends StatefulWidget {
  final List<Task> undoneTaskList;
  final List<Task> doneTaskList;

  DoneTaskPage({required this.undoneTaskList, required this.doneTaskList});

  @override
  _DoneTaskPageState createState() => _DoneTaskPageState();
}

class _DoneTaskPageState extends State<DoneTaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(widget.doneTaskList[index].title),
          value: widget.doneTaskList[index].isDone,
          onChanged: (value) {
            widget.doneTaskList[index].isDone = !widget.doneTaskList[index].isDone;
            widget.undoneTaskList.add(widget.doneTaskList[index]);
            widget.doneTaskList.removeAt(index);
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
      itemCount: widget.doneTaskList.length,
    );
  }
}