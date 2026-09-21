import 'package:flutter/material.dart';
import '../nav_telas_parametro_routesettings/task.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;

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