import 'package:flutter/material.dart';
import 'package:task_manager/Utility/helpers.dart';
import 'package:task_manager/task_details_checkbox.dart';

import 'Task/task.dart';
import 'Utility/dimens.dart';
import 'Utility/strings.dart';
import 'task_details_row.dart';

class TaskDetails extends StatelessWidget {
  final Task _task;

  TaskDetails(this._task);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_task.title),
      ),
      body: Card(
        margin: EdgeInsets.only(
          bottom: Dimens.smallDistance,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    TaskDetailsRow(
                      Strings.description,
                      _task.description,
                      Icons.description,
                    ),
                    Divider(),
                    TaskDetailsRow(Strings.dueDate,
                        Helpers.formatDate(_task.dueDate), Icons.date_range),
                    Divider(),
                    TaskDetailsRow(
                      Strings.taskType,
                      _task.getTaskTypeName(),
                      _task.getIcon(),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                margin: EdgeInsets.all(Dimens.standardDistance),
              ),
              flex: 4,
            ),
            Expanded(
              child: Container(
                child: TaskDetailsCheckbox(_task.status),
                margin: EdgeInsets.only(
                  top: Dimens.standardDistance + Dimens.smallDistance,
                ),
              ),
              flex: 1,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
