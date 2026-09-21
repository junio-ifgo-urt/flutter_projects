import 'package:flutter/material.dart';

void main() => runApp(const ImageExampleApp());

class ImageExampleApp extends StatelessWidget {
  const ImageExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Example App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Olá, Flutter!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ), // Text
              const SizedBox(height: 20),
              Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                width: 200,
              ), // Image.network
            ],
          ),
        ), // Center
      ), //Scaffold
    ); // MaterialApp
  } // Widget
}