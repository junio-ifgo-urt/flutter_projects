import 'package:flutter/material.dart';

// Novo widget para o corpo da tela
class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, required this.selectedIndex});

  final int selectedIndex;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
      children: [
        Text('Index 0: Home', style: optionStyle),
        SizedBox(height: 10), // Espaço entre o texto e o ícone
        Icon(Icons.home, size: 80, color: Colors.blue), // Ícone de tamanho aumentado
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Index 1: Business', style: optionStyle),
        SizedBox(height: 10),
        Icon(Icons.business, size: 80, color: Colors.green), // Ícone de tamanho aumentado
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Index 2: School', style: optionStyle),
        SizedBox(height: 10),
        Icon(Icons.school, size: 80, color: Colors.orange), // Ícone de tamanho aumentado
      ],
    ),
  ];//  <Widget>[]

  @override
  Widget build(BuildContext context) {
    return Center(child: _widgetOptions[selectedIndex]);
  }
}
