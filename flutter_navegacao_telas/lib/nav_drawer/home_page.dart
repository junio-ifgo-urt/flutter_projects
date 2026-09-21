import 'package:flutter/material.dart';
import '../nav_drawer/body_widget.dart';
import '../nav_drawer/drawer_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

// A classe MyHomePage permanece a mesma
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              //icon: const Icon(Icons.school),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ); // IconButton
          },
        ), // Builder
      ), // AppBar
      // Agora o corpo da tela é um widget separado
      body: BodyWidget(selectedIndex: _selectedIndex),
      // E o menu lateral também é um widget separado
      drawer: DrawerWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ), // DrawerWidget
    ); // Scaffold
  }
}

