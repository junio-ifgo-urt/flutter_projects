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
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Icon(Icons.directions_car),
                    text: 'Informações sobre carros',
                ), // Tab
                Tab(
                    icon: Icon(Icons.directions_transit),
                    text: 'Informações sobre trânsito',
                ), // Tab
                Tab(
                    icon: Icon(Icons.directions_bike),
                    text: 'Informações sobre bicicletas',
                ), // Tab
              ],
            ),
            title: const Text('Exemplo do uso de Tabs'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}