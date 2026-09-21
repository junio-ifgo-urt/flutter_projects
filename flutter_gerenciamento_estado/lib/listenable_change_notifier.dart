import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contador extends ChangeNotifier {
  int _valor = 0;

  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  final Contador contador = Contador();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorPage(contador: contador),
    );
  }
}

class ContadorPage extends StatelessWidget {
  final Contador contador;

  const ContadorPage({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo ChangeNotifier + ListenableBuilder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Observa mudanças no contador
            ListenableBuilder(
              listenable: contador,
              builder: (context, child) {
                return Text(
                  "Valor atual: ${contador.valor}",
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            IncrementarButton(contador: contador),
          ],
        ),
      ),
    );
  }
}

// Botão que chama o método de incrementar
class IncrementarButton extends StatelessWidget {
  final Contador contador;

  const IncrementarButton({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: contador.incrementar,
      child: Text("Incrementar"),
    );
  }
}
