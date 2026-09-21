import 'package:flutter/material.dart';

void main() => runApp(const SelectionContainerDisabledExampleApp());

class SelectionContainerDisabledExampleApp extends StatelessWidget {
  const SelectionContainerDisabledExampleApp({super.key});
  final String _name = 'Dart'; // Exemplo de valor para _name

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SelectionContainer.disabled Sample')),
        body: Center(
            child: Container(
                width: 150,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Hello $_name, how are you?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
            ),
        ), // Center
      ), //Scaffold
    ); // MaterialApp
  } // Widget
}