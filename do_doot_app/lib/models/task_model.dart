//import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String task;
  final int categoryId;
  final DateTime createdOn;
  final bool isActive;

  TaskModel({
    required this.id,
    required this.task,
    required this.categoryId,
    DateTime? createdOn,
    this.isActive = true,
  }) : createdOn = createdOn ?? DateTime.now();

  TaskModel.fromMap(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        task = data['task'] ?? '',
        categoryId = data['categoryId'] ?? 0,
        createdOn = data['createdOn'] != null ? DateTime.parse(data['createdOn']) : DateTime.now(),
        isActive = data['isActive'] ?? true;

  Map<String, dynamic> toMap() =>
      {'id': id, 'task': task, 'categoryId': categoryId, 'createdOn':createdOn.toString(),'isActive': isActive};

}
