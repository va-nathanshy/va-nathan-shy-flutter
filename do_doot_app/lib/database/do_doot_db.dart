import 'package:sqflite/sqflite.dart';
import 'package:do_doot_app/services/db_service.dart';
import 'package:do_doot_app/models/task_model.dart';

class DoDootDB {
  final tableName = 'tasks';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      "id" INTEGER NOT NULL,
      "task" TEXT NOT NULL,
      "category" TEXT NOT NULL,
      "isActive" INTEGER NOT NULL DEFAULT 1,
      PRIMARY KEY ("id" AUTOINCREMENT)
    );""");
  }

  Future<int> createTask({required String task}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (task) VALUE (?)''',
      [
        task
      ],
    );
  }

  Future<int> updateTask({required id, String? task}) async {
    final database = await DatabaseService().database;

    return await database.update(
      tableName,
      {
        if (task != null) 'task': task
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [
        id
      ],
    );
  }

  Future<void> deleteTask({required int id}) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE  id =?''', [id]);
  }

  Future<List<TaskModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final tasks = await database.rawQuery('''SELECT * FROM $tableName''');

    return tasks.map((task) => TaskModel.fromSqfliteDatabase(task)).toList();
  }

  Future<TaskModel> fetchById(int id) async {
    final database = await DatabaseService().database;
    final task = await database.rawQuery(
      '''SELECT * FROM $tableName WHERE id = ?''',
      [
        id
      ],
    );

    return TaskModel.fromSqfliteDatabase(task.first);
  }
}
