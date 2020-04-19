import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manager/Utility/helpers.dart';
import 'package:task_manager/task_controller.dart';
import 'Task/task.dart';
import 'Utility/dimens.dart';
import 'task_details.dart';

class TaskListElement extends StatelessWidget {
  final Task _task;
  final Function _update;
  final TaskController _taskController;

  TaskListElement(this._task, this._update, this._taskController);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      child: GestureDetector(
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
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Remove',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            _taskController.removeTask(_task);
            _update();
          },
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Done',
          color: Colors.green,
          icon: Icons.done,
          onTap: () {
            _task.markAsDone();
            _update();
          },
        )
      ],
    );
  }
}
