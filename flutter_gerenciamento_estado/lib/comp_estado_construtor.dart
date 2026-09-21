import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widget raiz (Stateless)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorPage(),
    ); // MaterialApp
  }
}

// StatefulWidget que mantém o estado
class ContadorPage extends StatefulWidget {
  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Compartilhando estado")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Passando o valor do contador pelo construtor
            ContadorDisplay(valor: _contador),
            SizedBox(height: 20),
            // Passando a função de incremento pelo construtor
            IncrementarButton(onPressed: _incrementar),
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }
}

// Widget filho que exibe o valor
class ContadorDisplay extends StatelessWidget {
  final int valor;
  const ContadorDisplay({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Valor atual: $valor",
      style: TextStyle(fontSize: 24),
    ); // Text
  }
}

// Widget filho que recebe a ação pelo construtor
class IncrementarButton extends StatelessWidget {
  final VoidCallback onPressed;
  const IncrementarButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text("Incrementar"),
    ); // ElevatedButton
  }
}
