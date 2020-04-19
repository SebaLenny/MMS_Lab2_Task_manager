import 'package:flutter/material.dart';

abstract class Task {
  String title;
  String description;
  DateTime dueDate;
  bool status;

  Task(
    String title,
    String description,
    DateTime dueDate, [
    status = false,
  ]){
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.status = status;
  }

  IconData getIcon();
  String getTaskTypeName();
}
