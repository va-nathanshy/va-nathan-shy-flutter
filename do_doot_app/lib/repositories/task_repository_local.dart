import 'package:do_doot_app/models/task_model.dart';
import 'package:do_doot_app/database/task_db.dart';
import 'package:do_doot_app/repositories/task_repository.dart';

class TaskRepository implements TaskRepositoryInterface {
  final TaskDb _db;

  TaskRepository(this._db);

  @override
  Future<List<TaskModel>> getAllTasks() async {
    List<Map<String, dynamic>> taskItems = await _db.getAllTasks();
    return taskItems.map((item) => TaskModel.fromMap(item)).toList();
  }

  @override
  Future<TaskModel?> getTask(String id) async {
    Map<String, dynamic>? task = await _db.findById(id);
    return task != null ? TaskModel.fromMap(task) : null;
  }

  @override
  Future<String> addTask(TaskModel task) async {
    return _db.addTask(task.toMap());
  }

  @override
  Future<String> updateTask(TaskModel task) async {
    return _db.updateTask(task.toMap());
  }

  @override
  Future<void> deleteTask(String id) async {
    _db.removeTask(id);
  }
}
