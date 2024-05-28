//import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String task;
  final int categoryId;
  final bool isActive;

  TaskModel({
    required this.id,
    required this.task,
    required this.categoryId,
    this.isActive = true,
  });

  TaskModel.fromMap(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        task = data['task'] ?? '',
        categoryId = data['categoryId'] ?? 0,
        isActive = data['isActive'] ?? true;

  Map<String, dynamic> toMap() => {
        'id': id,
        'task': task,
        'categoryId': categoryId,
        'isActive': isActive
      };

  static List<TaskModel> setTasks() {
    List<TaskModel> taskList = [];

    taskList.add(
      TaskModel(
        id: '01',
        categoryId: 1,
        task: 'Complete wretched Homework',
      ),
    );

    taskList.add(
      TaskModel(
        id: '02',
        categoryId: 2,
        task: 'Review that damn rat',
      ),
    );

    taskList.add(
      TaskModel(
        id: '02',
        categoryId: 2,
        task: 'Solve that pesky ticket',
      ),
    );

    taskList.add(
      TaskModel(
        id: '03',
        categoryId: 3,
        task: 'Rethink my life decisions',
      ),
    );

    taskList.add(
      TaskModel(
        id: '05',
        categoryId: 2,
        task: 'Wallow in self pity ;(',
      ),
    );

    return taskList;
  }
}
