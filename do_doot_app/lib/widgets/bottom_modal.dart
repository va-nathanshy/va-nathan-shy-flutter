// import 'package:flutter/material.dart';

// class BottomModal extends StatefulWidget {
//   const BottomModal({super.key});

//   @override
//   State<BottomModal> createState() => _BottomModalState();
// }

// class _BottomModalState extends State<BottomModal> {
//   @override
//   Widget build(BuildContext context) {
//     return _showModal;
//   }

//     Future<dynamic> _showModal(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           child: Center(
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Close'),
//                     ),
//                     const Text('Save'),
//                     ElevatedButton(
//                       onPressed: () {
//                         // _addTask(_taskController.text);
//                         widget.onTaskUpdated(widget.task, widget.task.isActive,
//                             _taskUpdateController.text);
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Save'),
//                     ),
//                   ],
//                 ),
//                 TextFormField(
//                   controller: _taskUpdateController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: widget.task.task,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
