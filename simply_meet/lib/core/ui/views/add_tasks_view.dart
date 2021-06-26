import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_datetimepicker_wrapper.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_dropdown_wrapper.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_textfield_wrapper.dart';
import 'package:simply_meet/core/view_models/add_tasks_viewmodel.dart';
import 'package:simply_meet/shared/models/task.dart';

import 'package:simply_meet/shared/utility/loader.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class AddTaskView extends StatefulWidget {
  static const routeName = "/addTaskView";

  final Task? task;

  AddTaskView({this.task});

  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    return ChangeNotifierProvider(
      create: (_) => AddTasksViewModel(formKey: _formKey),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 20.0),
                      child: Text(
                        "Add Task",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 36),
                      ),
                    ),
                    // Spacer(),
                    Consumer<AddTasksViewModel>(
                      builder: (_, myModel, __) {
                        final currTime = myModel.currTime;

                        return FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: FormBuilderTextFieldWrapper(
                                  context: context,
                                  hintText: "Title",
                                  initialValue: task?.title ?? '',
                                  keyboardType: TextInputType.text,
                                  name: "title",
                                  decoration: InputDecoration(
                                    labelText: "Title",
                                    labelStyle: TextStyle(color: Colors.white),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: FormBuilderDateTimePickerWrapper(
                                  firstDate: task?.date ?? currTime,
                                  name: "date",
                                  initialValue: task?.date ?? currTime,
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: "Date",
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: FormBuilderDropdownWrapper(
                                  dropdownMenu: myModel.dropdownMenu,
                                  hintText: "Select Priority",
                                  initialValue: task?.priority ?? "LOW",
                                  dropdownColor: Colors.grey.shade800,
                                  name: "priority",
                                  decoration: InputDecoration(
                                    labelText: "Priority",
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 20),
                                  ),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_rounded),
                                  iconSize: 20,
                                  iconEnabledColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Button(
                                  busy: myModel.busy,
                                  addTaskAction: task == null
                                      ? () async =>
                                          await myModel.addTask(context)
                                      : () async => await myModel.updateTask(
                                          context, task),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final bool busy;
  final void Function() addTaskAction;
  const Button({required this.busy, required this.addTaskAction});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(
        Icons.save_alt_rounded,
        color: Colors.white,
      ),
      label: busy
          ? Loaders.singleton.wave(screenHeight(context) * 0.03)
          : Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
      onPressed: addTaskAction,
    );
  }
}
