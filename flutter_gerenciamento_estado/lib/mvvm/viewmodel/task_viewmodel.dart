import 'package:flutter/foundation.dart';
import '../model/task_model.dart';
//import 'package:flutter_gerenciamento_estado/mvvm/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<TaskModel> _tarefas = [];

  List<TaskModel> get tarefas => List.unmodifiable(_tarefas);

  void adicionarTarefa(String titulo) {
    _tarefas.add(TaskModel(titulo));
    notifyListeners();
  }

  void alternarConclusao(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
    notifyListeners();
  }
}
