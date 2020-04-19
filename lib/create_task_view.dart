import 'package:flutter/material.dart';
import 'package:task_manager/task_controller.dart';

import 'Utility/strings.dart';
import 'create_task_form.dart';

class CreateTaskView extends StatelessWidget {
  final TaskController _taskController;
  final Function _update;

  CreateTaskView(this._taskController, this._update);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.createTaskHeadline),
        ),
        body: CreateTaskFrom(_taskController, _update));
  }
}
