import 'package:flutter/material.dart';
import 'package:task_manager/Task/task.dart';
import 'package:task_manager/Task/task_data.dart';
import 'package:task_manager/Task/task_factory.dart';

import 'Task/email_task.dart';
import 'Task/meeting_task.dart';
import 'Task/phone_task.dart';
import 'Task/task_type.dart';
import 'Task/todo_task.dart';
import 'task_list_element.dart';

class TaskController {
  List<Task> _tasks = List<Task>();

  TaskController() {
    _tasks.add(TodoTask(
      "Title of very cool todo Task!",
      "Description of the task",
      DateTime.now(),
      true,
    ));
    _tasks.add(EmailTask(
      "Title of very cool email Task!",
      "Description of the task",
      DateTime.now(),
    ));
    _tasks.add(PhoneTask(
      "Title of very cool phone Task!",
      "Description of the task",
      DateTime.now(),
      true,
    ));
    _tasks.add(MeetingTask(
      "Title of very cool meeting Task!",
      "Description of the task",
      DateTime.now(),
      true,
    ));
  }

  void addTask(
    TaskType taskType,
    String title,
    String description,
    DateTime dueDate,
  ) {
    _tasks.add(TaskFactory.createTask(taskType, title, description, dueDate));
  }

  void addReadyTask(TaskData taskData) {
    _tasks.add(TaskFactory.createTask(
      taskData.taskType,
      taskData.title,
      taskData.description,
      taskData.dueDate,
    ));
  }

  List<Widget> getTaskWidgets() {
    var toReturn = List<Widget>();
    for (var task in _tasks) {
      toReturn.add(
        TaskListElement(task),
      );
    }
    return toReturn;
  }

  static List<DropdownMenuItem<TaskType>> getEnumList() {
    var toReturn = List<DropdownMenuItem<TaskType>>();
    toReturn.add(DropdownMenuItem<TaskType>(
      child: Text("Email"),
      value: TaskType.email,
    ));
    toReturn.add(DropdownMenuItem<TaskType>(
      child: Text("Meeting"),
      value: TaskType.meeting,
    ));
    toReturn.add(DropdownMenuItem<TaskType>(
      child: Text("Phone"),
      value: TaskType.phone,
    ));
    toReturn.add(DropdownMenuItem<TaskType>(
      child: Text("Todo"),
      value: TaskType.todo,
    ));
    return toReturn;
  }
}
