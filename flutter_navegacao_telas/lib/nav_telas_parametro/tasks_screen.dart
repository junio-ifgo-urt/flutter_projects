import 'package:flutter/material.dart';
import '../nav_telas_parametro/task.dart';
import '../nav_telas_parametro/detail_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TasksScreen(
        tasks: List.generate(
          20,
              (i) => Task(
            'Task $i',
            'A description of what needs to be done for Task $i',
          ), // Task
        ), // List.generate
      ), // TasksScreen
    ), // MaterialApp
  );
}

class TasksScreen extends StatelessWidget {
  // observe que definimos construtor com parametro nomeados entre { ... }
  const TasksScreen({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            // Quando um user seleciona a ListTile, navega para DetailScreen
            // Note que está criando um DetailScreen e passando task para ela
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ), // MaterialPageRoute
              );
            },
          ); // ListTile
        },
      ), // ListView.builder
    ); // Scaffold
  }
}

