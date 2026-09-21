import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Classe principal do app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de uso de BottomNavigationBar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

// Tela principal que contém o BottomNavigationBar
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2; // Tela Info

  // Lista de telas que vão aparecer ao selecionar cada aba
  static const List<Widget> _pages = <Widget>[
    AgroPage(),
    BioPage(),
    InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de uso de BottomNavigationBar ")),
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: "Técnico em Agropecuária",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.biotech),
            label: "Técnico em Biotecnolgia",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: "Técnico em Informátia",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Tela Informática
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
      children: [
        Text('Técnico em Informátia', style: optionStyle),
        SizedBox(height: 20), // Espaço entre o texto e o ícone
        Icon(Icons.computer, size: 160, color: Colors.blue), // Ícone de tamanho aumentado
      ],
    ); // Column
  }
}

// Tela Agropecuaria
class AgroPage extends StatelessWidget {
  const AgroPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
      children: [
        Text('Técnico em Agropecuária', style: optionStyle),
        SizedBox(height: 20), // Espaço entre o texto e o ícone
        Icon(Icons.agriculture, size: 160, color: Colors.green), // Ícone de tamanho aumentado
      ],
    ); // Column
  }
}

// Tela Biotecnolgia
class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
      children: [
        Text('Técnico em Biotecnolgia', style: optionStyle),
        SizedBox(height: 20), // Espaço entre o texto e o ícone
        Icon(Icons.biotech, size: 160, color: Colors.red), // Ícone de tamanho aumentado
      ],
    ); // Column
  }
}
