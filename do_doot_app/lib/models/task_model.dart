//import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String task;
  String category;
  bool isActive;

  TaskModel({
    required this.id,
    required this.task,
    required this.category,
    this.isActive = true,
  });

  static List<TaskModel> setTasks() {
    List<TaskModel> taskList = [];

    taskList.add(
      TaskModel(
        id: '01',
        category: '01',
        task: 'Complete wretched Homework',
      ),
    );

    taskList.add(
      TaskModel(
        id: '02',
        category: '02',
        task: 'Review that damn rat',
      ),
    );

    taskList.add(
      TaskModel(
        id: '02',
        category: '02',
        task: 'Solve that pesky ticket',
      ),
    );

    taskList.add(
      TaskModel(
        id: '03',
        category: '03',
        task: 'Clean out that putrid litterbox',
      ),
    );

    taskList.add(
      TaskModel(
        id: '04',
        category: '03',
        task: 'Rethink my life decisions',
      ),
    );

    taskList.add(
      TaskModel(
        id: '05',
        category: '02',
        task: 'Wallow in self pity ;(',
      ),
    );

    return taskList;
  }

  factory TaskModel.fromSqfliteDatabase(Map<String, dynamic> map) => TaskModel(
        id: map['id']?.toInt() ?? 0,
        task: map['task'] ?? '',
        category: map['category'] ?? '',
        isActive: map['isActive'] ?? true,
      );
}
