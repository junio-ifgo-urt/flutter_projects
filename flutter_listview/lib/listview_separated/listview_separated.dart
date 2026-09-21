import 'package:flutter/material.dart';
import 'package:flutter_listview/listview_builder/produto.dart';

import 'package:flutter_listview/listview_builder/card_view_product.dart';

/*
@data: 18/09/25
@author: Júnio Lima

Classe que monta uma lista de produtos com  listview.separaed
 */
class ProductListScreenSeparated extends StatelessWidget {
  const ProductListScreenSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de produtos
    final List<Product> products = Product.generateProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Produtos (Separated)"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return CustomCardProduct(product: product);
        },
        separatorBuilder: (context, index) {
          if (index.isEven) {
            return const Divider(color: Colors.black);
          } else {
            return const Divider(color: Colors.red);
          }
        },

        /*
        separatorBuilder: (context, index) {
          // O que fica ENTRE os itens
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          );
        }, */
      ), // ListView.separated
    ); // Scaffold
  }
}
