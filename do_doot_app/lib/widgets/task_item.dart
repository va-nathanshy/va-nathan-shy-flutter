// import 'dart:html';

import 'package:flutter/material.dart';

// Models

import 'package:do_doot_app/models/task_model.dart';

// has to be stateful
class TaskItem extends StatefulWidget {
  final TaskModel task;
  final Function onTaskUpdated;
  final Function onTaskDeleted;

  const TaskItem({
    super.key,
    required this.task,
    required this.onTaskUpdated,
    required this.onTaskDeleted,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final _taskUpdateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        onLongPress: () {
          print('Long press todo item');
          _showModal(context);
          // setState
        },
        onTap: () {
          print('Tapped todo item');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.blue,
        leading: IconButton(
          icon: Icon(widget.task.isActive ? Icons.circle_outlined : Icons.check_circle),
          onPressed: () {
            widget.onTaskUpdated(widget.task, !widget.task.isActive, null);
          },
        ),
        title: Text(
          widget.task.task,
          style: TextStyle(
            fontSize: 16,
            decoration: widget.task.isActive ? TextDecoration.none : TextDecoration.lineThrough,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            print('Pressed delete button');
            widget.onTaskDeleted(widget.task.id);
          },
          icon: Icon(Icons.delete),
          iconSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<dynamic> _showModal(BuildContext context) {
    return showModalBottomSheet(
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
                    const Text('Save'),
                    ElevatedButton(
                      onPressed: () {
                        widget.onTaskUpdated(widget.task, widget.task.isActive, _taskUpdateController.text);
                        _taskUpdateController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
                TextField(
                  controller: _taskUpdateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.task.task,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
