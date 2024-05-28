import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:do_doot_app/database/do_doot_db.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return _database!;
    }

    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'do_doot.db';
    final path = await getDatabasesPath();

    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async => await DoDootDB().createTable(database);
}