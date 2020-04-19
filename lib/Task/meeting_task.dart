import 'package:flutter/material.dart';

import 'task.dart';

class MeetingTask extends Task {
  MeetingTask(
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
    return Icons.people;
  }

  @override
  String getTaskTypeName() {
    return "Meeting";
  }
}
