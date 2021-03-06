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
  TextEditingController editTitleContoroller = TextEditingController();

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
            showModalBottomSheet(context: context, builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('編集'),
                    leading: Icon(Icons.edit),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context) {
                        return SimpleDialog(
                          titlePadding: EdgeInsets.all(20),
                          title: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text('タイトルを編集'),
                                Container(
                                  width: 500,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder()
                                    ),
                                  controller: editTitleContoroller,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 200,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        widget.doneTaskList[index].title = editTitleContoroller.text;
                                        widget.doneTaskList[index].updatedTime = DateTime.now();
                                        Navigator.pop(context);
                                        setState(() {
                                        });
                                      },
                                    child: Text('編集'),
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                  ListTile(
                    title: Text('削除'),
                    leading: Icon(Icons.delete),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text('${widget.doneTaskList[index].title}を削除しますか？'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                widget.doneTaskList.removeAt(index);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text('はい')
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                            },
                              child: Text('キャンセル')
                            ),
                          ],
                        );
                      });
                    },
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