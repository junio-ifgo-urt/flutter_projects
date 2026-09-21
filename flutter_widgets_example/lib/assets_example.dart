import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// A classe principal apenas define o MaterialApp.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// A nova classe HomePage contém todo o layout.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Agora o "context" aqui já está abaixo do MaterialApp
    // e pode encontrar o ScaffoldMessenger.
    return Scaffold(
      appBar: AppBar(title: const Text('Image Example App')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Olá, Flutter!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 20),
            Image.asset('assets/images/darth.jpg'),
            const SizedBox(height: 10),
            const Icon(
              Icons.save,
              color: Colors.red,
              size: 48,
            ), // Icon
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Botão pressionado!"),
                  ), // SnackBar
                );
                print("Botão pressionado!");
              },
              child: const Text("Clique aqui"),
            ), // ElevatedButton
          ],
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
