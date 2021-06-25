import 'package:flutter/material.dart';
import 'package:simply_meet/core/ui/views/add_tasks_view.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget();

  Widget _buildTask(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Task Title"),
            subtitle: Text("Oct 2, 2019 • High"),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: theme(context).accentColor,
              value: true,
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
            builder: (_) => AddTaskScreen(),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 15),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
                  SizedBox(height: 10),
                  Text("1 of 10",
                      style: theme(context).textTheme.subtitle1!.copyWith(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            );
          }
          return _buildTask(index, context);
          // Container(
          //   height: 50,
          //   width: double.infinity,
          //   margin: EdgeInsets.all(15),
          //   color: theme(context).accentColor,
          // );
        },
      ),
    );
  }
}
