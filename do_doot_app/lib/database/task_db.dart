import 'package:do_doot_app/models/task_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskDb {
  late List<Map<String, dynamic>> _tasks = [];
  static final TaskDb _db = TaskDb._privateConstructor();

  TaskDb._privateConstructor();

  factory TaskDb() {
    return _db;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return _tasks;
  }

  Future<Map<String, dynamic>?> findById(String id) async {
    return _tasks.firstWhere((item) => item['id'] == id);
  }

  Future<String> addTask(Map<String, dynamic> task) async {
    task['id'] = _uuid.v4();
    _tasks.add(task);

    return task['id'];
  }

  Future<void> updateTask(Map<String, dynamic> updatedTask) async {
    int i = _tasks.indexWhere((task) => task['id'] == updatedTask['id']);
    _tasks[i] = updatedTask;
  }

  Future<void> removeTask(String id) async {
    _tasks.removeWhere((task) => task['id'] == id);
  }

  void generateSampleData() {
    var id = _uuid.v4();

    List<Map<String, dynamic>> sampleData = [
      TaskModel(
        id: id,
        task: 'Complete Homework',
        categoryId: 1,
      ).toMap(),
      TaskModel(
        id: id,
        task: 'Exterminate Rat',
        categoryId: 2,
      ).toMap(),
      TaskModel(
        id: id,
        task: 'Solve Ticket',
        categoryId: 2,
      ).toMap(),
      TaskModel(
        id: id,
        task: 'Clean Litterbox',
        categoryId: 3,
      ).toMap(),
      TaskModel(
        id: id,
        task: 'Rethink Life Choices',
        categoryId: 3,
      ).toMap(),
      TaskModel(
        id: id,
        task: 'Wallow in self-pity',
        categoryId: 2,
      ).toMap(),
    ];

    _tasks = [
      ..._tasks,
      ...sampleData
    ];
  }
}
