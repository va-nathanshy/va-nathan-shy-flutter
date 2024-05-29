import 'package:do_doot_app/models/category_model.dart';
import 'package:flutter/material.dart';

class AddTaskFloatingActionButton extends StatefulWidget {
  final List<CategoryModel> categoryList;
  const AddTaskFloatingActionButton({super.key, required this.categoryList});

  @override
  State<AddTaskFloatingActionButton> createState() =>
      _AddTaskFloatingActionButtonState();
}

class _AddTaskFloatingActionButtonState
    extends State<AddTaskFloatingActionButton> {
  final _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('Pressed cancel');
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                        const Text('New Task'),
                        ElevatedButton(
                          onPressed: () {
                            print('Pressed Save');
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _taskController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter New Task',
                      ),
                    ),
                    DropdownMenu(
                      initialSelection: widget.categoryList[0].categoryName,
                      requestFocusOnTap: true,
                      label: const Text('Category'),
                      dropdownMenuEntries: <DropdownMenuEntry<int>>[
                        for (CategoryModel category in widget.categoryList)
                          DropdownMenuEntry(
                              value: category.id, label: category.categoryName)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      backgroundColor: Colors.orange,
      tooltip: 'Add Task',
      child: const Icon(Icons.add),
    );
  }

  void _addTask(String taskToAdd) {
    setState(() {
      // taskList.add(TaskModel(
      //     id: DateTime.now().millisecondsSinceEpoch.toString(),
      //     categoryId: 1,
      //     task: taskToAdd));
      // _runFilter('');
    });
    _taskController.clear();
  }
}
