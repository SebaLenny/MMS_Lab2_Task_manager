import 'package:flutter/material.dart';

import 'task.dart';

class PhoneTask extends Task {
  PhoneTask(
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
    return Icons.phone;
  }

  @override
  String getTaskTypeName() {
    return "Phone";
  }
}
