import 'package:flutter/material.dart';

import 'task.dart';

class EmailTask extends Task {
  EmailTask(
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
    return Icons.alternate_email;
  }

  @override
  String getTaskTypeName() {
    return "Email";
  }
}
