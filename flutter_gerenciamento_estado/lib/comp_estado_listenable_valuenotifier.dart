import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ContadorPage()));
}

class ContadorPage extends StatelessWidget {
  final ValueNotifier<int> contador = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ValueNotifier + ValueListenableBuilder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: contador,
              builder: (context, valor, child) {
                return Text("Valor: $valor",
                    style: TextStyle(fontSize: 24));
              },
            ), // ValueListenableBuilder
            ElevatedButton(
              onPressed: () => contador.value++,
              child: Text("Incrementar"),
            ), // ElevatedButton
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }
}
