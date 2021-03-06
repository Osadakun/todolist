import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/pages/add_task_page.dart';
import 'package:todoapp/pages/done_task_page.dart';
import 'package:todoapp/pages/undone_task_page.dart';
import 'package:todoapp/pages/add_task_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Task> undoneTaskList = [
  ];

  List<Task> doneTaskList = [];
  bool showUndoneTaskPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter x Firebase for WEB'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          showUndoneTaskPage ? UndoneTaskPage(undoneTaskList: undoneTaskList, doneTaskList: doneTaskList,)
            : DoneTaskPage(undoneTaskList: undoneTaskList, doneTaskList: doneTaskList),               // 三項演算子が使われている
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    showUndoneTaskPage = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.redAccent,
                    child: Text('メモ',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showUndoneTaskPage = false;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('メモの登録',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                    height: 50,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskPage(undoneTaskList: undoneTaskList)));
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
