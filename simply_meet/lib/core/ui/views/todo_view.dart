import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simply_meet/core/ui/views/add_tasks_view.dart';
import 'package:simply_meet/core/view_models/database_helper.dart';
import 'package:simply_meet/core/view_models/todo_view_model.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class ToDoWidget extends StatefulWidget {
  @override
  _ToDoWidgetState createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  // const TodoWidget();
  Future<List<Task>>? _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  void _initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                fontSize: 18,
                decoration: task.status == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough,
              ),
            ),
            subtitle: Text(
              '${_dateFormatter.format(task.date)} • ${task.priority}',
              style: TextStyle(
                fontSize: 15,
                decoration: task.status == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough,
              ),
            ),
            trailing: Checkbox(
              onChanged: (value) {
                task.status = value! ? 1 : 0;
                DatabaseHelper.instance.updateTask(task);
                _updateTaskList();
              },
              activeColor: theme(context).accentColor,
              value: true,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddTaskScreen(
                  updateTaskList: _updateTaskList,
                  task: task,
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme(context).accentColor,
        child: Icon(
          Icons.add_task_rounded,
          color: Colors.white,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddTaskScreen(
              updateTaskList: _updateTaskList,
              task: task,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          // final int completedTaskCount = snapshot.data!
          //     .where((Task task) => task.status == 1)
          //     .toList()
          //     .length;

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 15),
            itemCount: 1 + snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "My Tasks",
                        style: theme(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black, fontSize: 35),
                      ),
                      // SizedBox(height: 10),
                      // Text("1 of 10",
                      //     style: theme(context).textTheme.subtitle1!.copyWith(
                      //         fontSize: 20,
                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.w600)),
                    ],
                  ),
                );
              }
              return _buildTask(snapshot.data![index - 1], context);
              // Container(
              //   height: 50,
              //   width: double.infinity,
              //   margin: EdgeInsets.all(15),
              //   color: theme(context).accentColor,
              // );
            },
          );
        },
      ),
    );
  }
}
