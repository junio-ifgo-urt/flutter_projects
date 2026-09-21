import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Exemplo com Telas Completas'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  text: 'Carro',
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                  text: 'Trânsito',
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: 'Bike',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Coloque suas telas completas aqui!
              CarroScreen(),
              TransitoScreen(),
              BikeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// Uma tela de exemplo para a aba de carro
class CarroScreen extends StatelessWidget {
  const CarroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_car, size: 80, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Conteúdo da tela de Carros',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

// Uma tela de exemplo para a aba de trânsito
class TransitoScreen extends StatelessWidget {
  const TransitoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_transit, size: 80, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Conteúdo da tela de Trânsito',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

// Uma tela de exemplo para a aba de bicicleta
class BikeScreen extends StatelessWidget {
  const BikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_bike, size: 80, color: Colors.orange),
          SizedBox(height: 20),
          Text(
            'Conteúdo da tela de Bicicletas',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}