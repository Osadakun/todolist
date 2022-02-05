import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class AddTaskPage extends StatefulWidget {
  final List<Task> undoneTaskList;
  AddTaskPage({required this.undoneTaskList});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController titleContoroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タスクを追加'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text('タイトル'),
            ),
            Container(
              width: 500,
              child: TextField(
                controller: titleContoroler,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Task newTask = Task(
                          title: titleContoroler.text,
                          isDone: false,
                          createdTime: DateTime.now()
                        );
                        FirebaseFirestore.instance.collection('task').doc().set({
                          'title': newTask.title,
                          'is_done': newTask.isDone,
                          'created_at': newTask.createdTime});
                        // widget.undoneTaskList.add(newTask);
                        Navigator.pop(context);
                      },
                      child: Text('追加')
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
