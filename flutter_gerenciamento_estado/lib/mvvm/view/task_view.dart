import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/task_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(home: TaskPage()),
    ), // ChangeNotifierProvider
  );
}

class TaskPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TaskViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas - MVVM")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: "Nova tarefa"),
                  ), // TextField
                ), // Expanded
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      viewModel.adicionarTarefa(_controller.text);
                      _controller.clear();
                    }
                  },
                ) // IconButton
              ],
            ), // Row
          ), // Padding
          Expanded(
            child: Consumer<TaskViewModel>(
              builder: (context, model, child) {
                if (model.tarefas.isEmpty) {
                  return Center(child: Text("Nenhuma tarefa adicionada"));
                }
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = model.tarefas[index];
                    return CheckboxListTile(
                      title: Text(tarefa.titulo),
                      value: tarefa.concluida,
                      onChanged: (_) => model.alternarConclusao(index),
                    ); // CheckboxListTile
                  },
                ); // ListView.builder
              },
            ), // Consumer
          ) // Expanded
        ],
      ), // Column
    ); // Scaffold
  }
}


