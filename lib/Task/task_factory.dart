import 'package:task_manager/Task/email_task.dart';
import 'package:task_manager/Task/meeting_task.dart';
import 'package:task_manager/Task/phone_task.dart';
import 'package:task_manager/Task/task.dart';
import 'package:task_manager/Task/todo_task.dart';

import 'task_type.dart';



class TaskFactory {
  static Task createTask(
      TaskType taskType, String title, String description, DateTime dueDate) {
    switch (taskType) {
      case TaskType.email:
        return EmailTask(title, description, dueDate);
      case TaskType.meeting:
        return MeetingTask(title, description, dueDate);
      case TaskType.phone:
        return PhoneTask(title, description, dueDate);
      case TaskType.todo:
        return TodoTask(title, description, dueDate);
      default:
        return null;
    }
  }
}
