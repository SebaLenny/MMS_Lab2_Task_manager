import 'package:flutter/material.dart';
import 'package:task_manager/task_controller.dart';

class TaskTextFormField extends StatelessWidget {
  final String label;
  final TaskController taskController;
  final Function(String) updateField;
  final Function(String) validateFunction;
  final GlobalKey<FormState> formKey;
  final String initialValue;

  TaskTextFormField(
      {@required this.taskController,
      @required this.label,
      @required this.updateField,
      @required this.validateFunction,
      @required this.formKey,
      this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: validateFunction,
      onSaved: (String value) {
        if (formKey.currentState.validate()) {
          updateField(value.trim());
        }
      },
      initialValue: initialValue,
    );
  }
}
