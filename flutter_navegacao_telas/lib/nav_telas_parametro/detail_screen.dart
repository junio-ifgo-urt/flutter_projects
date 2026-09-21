import 'package:flutter/material.dart';
import '../nav_telas_parametro/task.dart';

class DetailScreen extends StatelessWidget {
  // No construtor, require um Task.
  const DetailScreen({super.key, required this.task});

  // Declare um campo que guarde Task
  final Task task;

  @override
  Widget build(BuildContext context) {
    // Use a Task para criar a UI.
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          task.description,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ), // Padding
    ); // Scaffold
  }
}