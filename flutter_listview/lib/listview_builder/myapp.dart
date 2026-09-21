import 'package:flutter/material.dart';
import 'package:flutter_listview/listview_builder/produto.dart';

import 'package:flutter_listview/listview_builder/card_view_product.dart';

/*
@data: 18/09/25
@author: Júnio Lima

Duas formas de executar o listview.builder
1) usando essa classe com main que chama a classe MyApp nesse mesmo arquivo
2) usando a classe main.dart que chama a classe list_view_builder
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de produtos
    final List<Product> products = Product.generateProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Produtos"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ), // AppBar
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length, // número de itens
        itemBuilder: (context, index) {
          final product = products[index];
          return CustomCardProduct(product: product);
        },
      ), // ListView.builder
    ); // Scaffold
  }
}
