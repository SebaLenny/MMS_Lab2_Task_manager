import 'package:flutter/material.dart';
import 'package:task_manager/Utility/helpers.dart';
import 'Task/task.dart';
import 'Utility/dimens.dart';
import 'task_details.dart';

class TaskListElement extends StatelessWidget {
  final Task _task;

  TaskListElement(this._task);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(
          bottom: Dimens.smallDistance,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                leading: Icon(_task.getIcon()),
                title: Text(_task.title),
                subtitle: Text(Helpers.formatDate(_task.dueDate)),
              ),
              flex: 4,
            ),
            Expanded(
              child: _task.status
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      null,
                    ),
              flex: 1,
            ),
          ],
        ),
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetails(_task),
          ),
        )
      },
    );
  }
}
