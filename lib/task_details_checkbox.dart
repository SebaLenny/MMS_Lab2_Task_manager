import 'package:flutter/material.dart';

class TaskDetailsCheckbox extends StatelessWidget {
  final bool status;

  TaskDetailsCheckbox(this.status);

  @override
  Widget build(BuildContext context) {
    return status
        ? Icon(
            Icons.check_box,
            color: Colors.green,
          )
        : Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey,
          );
  }
}
