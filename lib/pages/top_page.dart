import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Task> taskList = [
    Task(
        title: '宿題',
        isDone: false,
        createdTime: DateTime.now(),
        updatedTime: null),
    Task(title: '買い出し', isDone: false, createdTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter x Firebase for WEB'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(taskList[index].title),
            value: taskList[index].isDone,
            onChanged: (value) {
              taskList[index].isDone = !taskList[index].isDone;
              taskList.removeAt(index);
              setState(() {});
            },
          );
        },
        itemCount: taskList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
