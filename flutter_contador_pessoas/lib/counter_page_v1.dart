import 'package:flutter/material.dart';

class CounterPageV1 extends StatelessWidget{
  const CounterPageV1({super.key});

  @override
  Widget build(BuildContext context) {
    // O Scaffold é a estrutura da tela.
    return Scaffold(
      appBar: AppBar(
          title: const Text('Contador')
      ),
      body: const Center(
        child: Text('Você pressionou o botão'),
      )
    );
  } // widget
} // class