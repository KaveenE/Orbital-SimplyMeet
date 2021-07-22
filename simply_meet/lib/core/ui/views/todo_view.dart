import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/add_tasks_view.dart';
import 'package:simply_meet/core/view_models/sortfilter_viewmodel.dart';
import 'package:simply_meet/core/view_models/todo_viewmodel.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class ToDoView extends StatelessWidget {
  static const routeName = "/toDoView";

  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<List<Task>>(context);

    final sortFilterViewModel = Provider.of<SortFilterViewModel>(context);

    final todoViewModel = ToDoViewModel();
    final modifiedTaskList =
        todoViewModel.modifyTaskList(taskList, context, sortFilterViewModel);

    return Scaffold(
      backgroundColor: theme(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme(context).accentColor,
        child: Icon(
          Icons.add_task_rounded,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(
          context,
          AddTaskView.routeName,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Tasks",
                    style: theme(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black, fontSize: 35),
                  ),
                ),
                SizedBox(height: screenHeight(context) * 0.02),
                Text(
                  "${ToDoViewModel.completedTasks(taskList)} of ${taskList.length}",
                  style: theme(context).textTheme.subtitle1!.copyWith(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: screenHeight(context) * 0.005),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15),
              itemCount: modifiedTaskList.length,
              itemBuilder: (BuildContext context, int index) {
                return todoViewModel.buildTask(
                    modifiedTaskList[index], context);
              },
            ),
          )
        ],
      ),
    );
  }
}
