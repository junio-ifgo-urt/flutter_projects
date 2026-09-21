import 'package:flutter/material.dart';

class CounterPageV2 extends StatelessWidget{
  //const CounterPageV2({super.key});

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // O Scaffold é a estrutura da tela.
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
            ), // Text
            Text(
              '$_counter', // Exibe o valor da variável _counter.
              style: Theme.of(context).textTheme.headlineMedium,
            ), // Text
          ], // <Widget>[]
        ), // Column
      ), // Center
    ); // Scaffold
  } // Widget
} // class