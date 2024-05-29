import 'package:flutter/material.dart';

class AddTaskFloatingActionButton extends StatefulWidget {
  const AddTaskFloatingActionButton({super.key});

  @override
  State<AddTaskFloatingActionButton> createState() =>
      _AddTaskFloatingActionButtonState();
}

class _AddTaskFloatingActionButtonState
    extends State<AddTaskFloatingActionButton> {
  final _taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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


//  builder: (BuildContext context) {
//             return SizedBox(
//               child: Center(
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text('Close'),
//                         ),
//                         const Text('New Task'),
//                         ElevatedButton(
//                           onPressed: () {
//                             _addTask(_taskController.text);
//                             Navigator.pop(context);
//                           },
//                           child: const Text('Save'),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         TextField(
//                           controller: _taskController,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'Enter New Task',
//                           ),
//                         ),
//                       ],
//                     ),
//                     //DROPDOWN MENU GOES HERE
//                   ],
//                 ),
//               ),
//             );
//           },