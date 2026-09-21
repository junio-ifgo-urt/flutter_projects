import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecione uma opção')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Selecione uma opção para retornar",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
            ), // Padding
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Fecha a tela e retorna "Sim!" como resultado
                  Navigator.pop(context, 'Sim!');
                },
                child: const Text('Sim!'),
              ), // ElevatedButton
            ), // Padding
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Fecha a tela e retorna "Não." como resultado
                  Navigator.pop(context, 'Não.');
                },
                child: const Text('Não.'),
              ), // ElevatedButton
            ), // Padding
          ], // <Widget>[
        ), // Column
      ), // Center
    ); // Scaffold
  }
}