import 'package:flutter/material.dart';

// A tela em si, que terá um estado mutável.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  // método obrigatorio de todo StatefulWidget que cria (ou devolve) o objeto
  //  de estado que vai controlar esse widget
  @override
  State<CounterPage> createState() => _CounterPageState();
}

// A classe que contém o estado e a lógica do app.
class _CounterPageState extends State<CounterPage> {
  // Variável de instância privada que armazenará a contagem.
  int _counter = 0;

  // Método em Dart que incrementa a contagem.
  void _incrementCounter() {
    // setState é um método do Flutter que informa que o estado mudou
    // e que a interface deve ser redesenhada.
    setState(() {
      _counter++;
      print('O contador atual é: $_counter'); // Exemplo de uso de string em Dart
    });
  }

  @override
  Widget build(BuildContext context) {
    // === Widgets, sem entrar em detalhes ===
    // Mencione que o Scaffold é a estrutura da tela.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Pessoas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você pressionou o botão este número de vezes:',
            ),
            Text(
              '$_counter', // Exibe o valor da variável _counter.
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Chama o método _incrementCounter()
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  } // Widget
}