import 'package:flutter/material.dart';
//import 'package:flutter_contador_pessoas/counter_page_v1.dart';
//import 'package:flutter_contador_pessoas/counter_page_v2.dart';
//import 'package:flutter_contador_pessoas/counter_page_v3.dart';
import 'package:flutter_contador_pessoas/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Simples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const CounterPageV1(),
      //home: CounterPageV3(),
      home: CounterPage(),
    );
  }
}

