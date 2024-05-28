import 'package:flutter/material.dart';
// Models
import 'package:do_doot_app/models/task_model.dart';
import 'package:do_doot_app/models/category_model.dart';
// Widgets
import 'package:do_doot_app/widgets/task_item.dart';

//DB
//import 'package:do_doot_app/database/do_doot_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> taskList = [];
  List<TaskModel> searchTaskList = [];
  List<CategoryModel> categoryList = [];

  // Future<List<TaskModel>>? futureTasks;
  // final taskDB = DoDootDB();

  final _taskController = TextEditingController();

  void _getInitialInfo() {
    taskList = TaskModel.setTasks(); // turn this into a getApi function thing
    searchTaskList = TaskModel.setTasks();
    categoryList = CategoryModel.setCategories();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: _title(),
            ),
            const SizedBox(height: 30),
            _tasks(),
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search',
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                print('Search Button Tapped');
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
            PopupMenuButton(
              icon: Icon(Icons.filter_alt),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: Text('Item1'),
                ),
                const PopupMenuItem(
                  child: Text('Item2'),
                ),
                const PopupMenuItem(
                  child: Text('Item3'),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                print('More button pressed');
              },
              icon: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _title() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Do Doot',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('${taskList.length} tasks'),
          ],
        ),
      ],
    );
  }

  Column _tasks() {
    return Column(
      children: [
        for (TaskModel task in searchTaskList.reversed)
          TaskItem(
            task: task,
            onTaskUpdated: _updateTask,
            onTaskDeleted: _deleteTask,
          ),
      ],
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                        const Text('New Task'),
                        ElevatedButton(
                          onPressed: () {
                            _addTask(_taskController.text);
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter New Task',
                      ),
                    ),
                    //DROPDOWN MENU GOES HERE
                  ],
                ),
              ),
            );
          },
        );
      },
      tooltip: 'Add Task',
      child: const Icon(Icons.add),
    );
  }

  // Functions
  void _addTask(String taskToAdd) {
    setState(() {
      taskList.add(TaskModel(id: DateTime.now().millisecondsSinceEpoch.toString(), category: 'Test', task: taskToAdd));
      _runFilter('');
    });
    _taskController.clear();
  }

  void _updateTask(TaskModel taskToUpdate, bool updatedStatus, String? updatedTask) {
    setState(() {
      taskToUpdate.task = updatedTask ?? taskToUpdate.task;
      //taskToUpdate.category
      taskToUpdate.isActive = updatedStatus;
      _runFilter('');
    });
  }

  void _deleteTask(String id) {
    setState(() {
      taskList.removeWhere((element) => element.id == id);
      _runFilter('');
    });
  }

  void _runFilter(String searchKeyword) {
    List<TaskModel> searchResults = [];

    if (searchKeyword.isEmpty) {
      searchResults = taskList;
    } else {
      searchResults = taskList.where((element) => element.task.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
    }
    setState(() {
      searchTaskList = searchResults;
    });
  }
}
