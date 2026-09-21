import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modelo de estado
class NomeModel extends ChangeNotifier {
  String _nome = "";
  String get nome => _nome;

  void atualizarNome(String novoNome) {
    _nome = novoNome;
    notifyListeners(); // avisa os widgets interessados
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NomeModel(),
      child: MyApp(),
    ), // ChangeNotifierProvider
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NomePage(),
    ); // MaterialApp
  }
}

class NomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nomeModel = context.read<NomeModel>(); // acesso sem "ouvir"

    return Scaffold(
      appBar: AppBar(title: Text("Exemplo com Provider")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Digite seu nome",
                border: OutlineInputBorder(),
              ), // InputDecoration
              onChanged: (valor) => nomeModel.atualizarNome(valor),
            ), //TextField
            SizedBox(height: 20),
            // Usa Consumer para "ouvir" mudanças
            Consumer<NomeModel>(
              builder: (context, model, child) {
                return Text(
                  model.nome.isEmpty
                      ? "Nenhum nome digitado"
                      : "Olá, ${model.nome}!",
                  style: TextStyle(fontSize: 22),
                ); // Text
              },
            ), // Consumer
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
