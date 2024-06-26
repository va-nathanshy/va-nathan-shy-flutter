import 'package:do_doot_app/database/category_db.dart';
import 'package:do_doot_app/database/task_db.dart';
import 'package:do_doot_app/widgets/add_task_floating_action_button.dart';
import 'package:flutter/material.dart';
// Models
import 'package:do_doot_app/models/task_model.dart';
import 'package:do_doot_app/models/category_model.dart';
// Widgets
import 'package:do_doot_app/widgets/task_item.dart';
//DB
import 'package:do_doot_app/repositories/task_repository_local.dart';
import 'package:do_doot_app/repositories/category_repository_local.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Updated DB
  final TaskRepository _taskRepository = TaskRepository(TaskDb());
  final CategoryRepository _categoryRepository =
      CategoryRepository(CategoryDb());

  // Lists
  List<TaskModel> _taskList = [];
  List<CategoryModel> _categoryList = [];
  List<TaskModel> searchTaskList = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    _loadTasks();
    _loadCategories();
  }

  void _loadTasks() async {
    List<TaskModel> taskList = await _taskRepository.getAllTasks();

    setState(() {
      _taskList = taskList;
    });
  }

  void _loadCategories() async {
    List<CategoryModel> categoryList =
        await _categoryRepository.getAllCategories();
    setState(() {
      _categoryList = categoryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: _title(),
            ),
            const SizedBox(height: 30),
            _tasks(),
          ],
        ),
      ),
      floatingActionButton: AddTaskFloatingActionButton(categoryList: _categoryList),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Visibility(
        visible: true, 
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
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
            _popupMenuButton(),
            IconButton(
              onPressed: () {
                print('More button pressed');
              },
              icon: const Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }

  PopupMenuButton<dynamic> _popupMenuButton() {
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        for (CategoryModel category in _categoryList)
          PopupMenuItem(
              onTap: () {
                // call filter thing here
                print('Tapped ${category.id}');
              },
              child: Text(category.categoryName))
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
            Text('${_taskList.length} tasks'),
          ],
        ),
      ],
    );
  }

  Column _tasks() {
    return Column(
      children: [
        for (TaskModel task in _taskList)
          (_taskList.isNotEmpty) ?
          TaskItem(
            task: task,
          ) : const Text('No tasks :)'),
      ],
    );
  }

  // Functions
  void _updateTask(
      TaskModel taskToUpdate, bool updatedStatus, String? updatedTask) {
    setState(() {
      // taskToUpdate.task = updatedTask ?? taskToUpdate.task;
      // //taskToUpdate.category
      // taskToUpdate.isActive = updatedStatus;
      _runFilter('');
    });
  }

  void _deleteTask(String id) {
    setState(() {
      // taskList.removeWhere((element) => element.id == id);
      _runFilter('');
    });
  }
  
  void _runFilter(String searchKeyword) {
    // List<TaskModel> searchResults = [];

    // if (searchKeyword.isEmpty) {
    //   searchResults = taskList;
    // } else {
    //   searchResults = taskList
    //       .where((element) =>
    //           element.task.toLowerCase().contains(searchKeyword.toLowerCase()))
    //       .toList();
    // }
    // setState(() {
    //   searchTaskList = searchResults;
    // });
  }
}
