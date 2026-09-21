import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorPage(),
    );
  }
}

class ContadorPage extends StatefulWidget {
  @override
  State<ContadorPage> createState() => _ContadorPageState();
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
      appBar: AppBar(title: Text("Exemplo Callback")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor atual: $_contador", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            // Passamos o callback para o filho
            IncrementarButton(onIncrement: _incrementar),
          ],
        ),
      ),
    );
  }
}

// Widget filho só executa a função passada pelo pai
class IncrementarButton extends StatelessWidget {
  final VoidCallback onIncrement;

  const IncrementarButton({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onIncrement,
      child: Text("Incrementar"),
    );
  }
}
