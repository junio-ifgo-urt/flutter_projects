class TaskModel {
  final String titulo;
  bool concluida;
  // - Os colchetes {} indicam que esse é um parâmetro nomeado opcional
  // com valor padrão se não passar nada
  TaskModel(this.titulo, {this.concluida = false});
}