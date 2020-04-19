import 'package:flutter/material.dart';

import 'task.dart';

class TodoTask extends Task {
  TodoTask(
    title,
    description,
    dueDate, [
    bool status = false,
  ]) : super(
          title,
          description,
          dueDate,
          status,
        );

  @override
  IconData getIcon() {
    return Icons.check;
  }

  @override
  String getTaskTypeName() {
    return "To do";
  }
}
