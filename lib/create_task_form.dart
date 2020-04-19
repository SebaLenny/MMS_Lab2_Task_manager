import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/Task/task_data.dart';
import 'package:task_manager/Utility/dimens.dart';
import 'package:task_manager/task_controller.dart';
import 'package:task_manager/task_text_from_field.dart';

import 'Utility/strings.dart';

class CreateTaskFrom extends StatefulWidget {
  final TaskController _taskController;
  final TaskData newTask = TaskData();

  CreateTaskFrom(this._taskController);

  @override
  _CreateTaskFromState createState() => _CreateTaskFromState(_taskController);
}

class _CreateTaskFromState extends State<CreateTaskFrom> {
  final _formKey = GlobalKey<FormState>();
  final TaskController taskController;

  _CreateTaskFromState(this.taskController);

  void update() {
    setState(() {});
    FocusScope.of(context).unfocus();
  }

  void updateDescription(String value) {
    widget.newTask.description = value.trim();
  }

  void updateTitle(String value) {
    widget.newTask.title = value.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(Dimens.standardDistance),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TaskTextFormField(
              formKey: _formKey,
              label: Strings.title,
              taskController: widget._taskController,
              validateFunction: (String value) {
                if (value.trim().isNotEmpty) {
                  return null;
                }
                return Strings.mandatoryField;
              },
              updateField: updateTitle,
              initialValue: widget.newTask.title,
            ),
            TaskTextFormField(
              formKey: _formKey,
              label: Strings.description,
              taskController: widget._taskController,
              validateFunction: (String value) {
                return null;
              },
              updateField: updateDescription,
              initialValue: widget.newTask.description,
            ),
            DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              editable: false,
              decoration: InputDecoration(
                  labelText: Strings.dueDate, hasFloatingPlaceholder: false),
              onChanged: (date) {
                setState(() => widget.newTask.dueDate = date);
              },
              validator: (dateTime) {
                return dateTime == null ? Strings.mandatoryField : null;
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: Strings.taskType),
              items: TaskController.getEnumList(),
              onChanged: (taskType) {
                setState(() => widget.newTask.taskType = taskType);
              },
              validator: (taskType) {
                return taskType == null ? Strings.mandatoryField : null;
              },
              value: widget.newTask.taskType,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: Dimens.standardDistance),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    widget._taskController.addReadyTask(widget.newTask);
                    Navigator.pop(context);
                  }
                },
                child: Text(Strings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
