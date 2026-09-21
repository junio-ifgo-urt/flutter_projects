import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// InheritedWidget que compartilha o contador
class ContadorInherited extends InheritedWidget {
  final int contador;
  final VoidCallback incrementar;

  const ContadorInherited({
    super.key,
    required this.contador,
    required this.incrementar,
    required Widget child,
  }) : super(child: child);

  // Método para acessar facilmente o InheritedWidget
  static ContadorInherited of(BuildContext context) {
    final ContadorInherited? result =
    context.dependOnInheritedWidgetOfExactType<ContadorInherited>();
    assert(result != null, 'Nenhum ContadorInherited encontrado no contexto');
    return result!;
  }

  @override
  bool updateShouldNotify(ContadorInherited oldWidget) {
    return oldWidget.contador != contador;
  }
}

// StatefulWidget que mantém o estado e fornece via InheritedWidget
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  void _incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContadorInherited(
      contador: contador,
      incrementar: _incrementar,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Exemplo InheritedWidget")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContadorDisplay(),
                SizedBox(height: 20),
                IncrementarButton(),
              ],
            ), // Column
          ), // Center
        ), // Scaffold
      ), // MaterialApp
    ); // ContadorInherited
  }
}

// Widget que consome o valor
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contador = ContadorInherited.of(context).contador;
    return Text(
      "Valor atual: $contador",
      style: TextStyle(fontSize: 24),
    ); // Text
  }
}

// Widget que consome a função
class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incrementar = ContadorInherited.of(context).incrementar;
    return ElevatedButton(
      onPressed: incrementar,
      child: Text("Incrementar"),
    ); // ElevatedButton
  }
}