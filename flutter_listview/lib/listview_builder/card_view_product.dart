import 'package:flutter/material.dart';
import 'package:flutter_listview/listview_builder/produto.dart';

/*
@data: 18/09/25
@author: Júnio Lima

Classe que monta um CardView com um produto
 */
class CustomCardProduct extends StatelessWidget {
  final Product product;

  const CustomCardProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 160, // largura fixa
      child: Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(product.icon, color: Colors.blue, size: 32),
        title: Text(product.name),
        subtitle: Text("Preço: R\$ ${product.price}"),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${product.name} adicionado ao carrinho!"),
              ), // SnackBar
            );
          },
          child: const Text("Comprar"),
        ), // ElevatedButton
      ), // ListTile
    ) // Card
    ); // SizeBox
  }
}