import 'package:do_doot_app/models/task_model.dart';

abstract class TaskRepositoryInterface {
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel?> getTask(String id);
  Future<String> addTask(TaskModel task); //returns id
  Future<String> updateTask(TaskModel task); //returns id
  Future<void> deleteTask(String id);
}
