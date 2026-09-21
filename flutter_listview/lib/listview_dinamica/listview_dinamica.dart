import 'package:flutter/material.dart';

import '../listview_builder/card_view_product.dart';
import '../listview_builder/produto.dart';
import 'add_product.dart';

void main() {
  runApp(const ListViewDinamica());
}

/*
@data: 18/09/25
@author: Júnio Lima

Classe que monta uma lista de produtos com listview.separator
*/
class ListViewDinamica extends StatelessWidget {
  const ListViewDinamica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Lista mutavel inicial de produtos
  //List<Product> products = Product.generateProducts().sort((a, b) => a.name.compareTo(b.name));
  List<Product> products = Product.generateProducts();

  // Método para navegar até a tela de cadastro e receber o novo produto
  Future<void> _addProduct() async {
    // Abre tela de cadastro e espera objeto Product retornado via Navigator.pop
    final newProduct = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );

    if (newProduct != null) {
      print("Novo produto cadastrado: ${newProduct.name}");
      // Atualiza a UI adicionando o item e chamando setState
      setState(() {
        products.add(newProduct);
      });
    } else {
      // opcional: debug
      print('Nenhum produto retornado (user cancelou ou validação falhou)');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Produtos"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          //return CustomCardProduct(product: product); // sem exclusão
          // adicionar a exclusão de itens da lista
          return Dismissible(
            key: ValueKey(product.name), // chave única
            direction: DismissDirection.endToStart, // só arrasta p/ esquerda
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ), // Container
            onDismissed: (direction) {
              // guarda produto removido e posição original
              final removedProduct = product;
              final removedIndex = index;

              setState(() {
                products.removeAt(index);
              });

              // mostra snackbar com opção de desfazer
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${removedProduct.name} removido"),
                  action: SnackBarAction(
                    label: "Desfazer",
                    onPressed: () {
                      setState(() {
                        products.insert(removedIndex, removedProduct);
                      });
                    },
                  ), // SnackBarAction
                ), // SnackBar
              );
            },
            child: CustomCardProduct(product: product),
          ); // Dismissible
        },
        // separatorBuilder é chamado entre os itens
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 2,
            indent: 8,
            endIndent: 8,
          ); // Divider
        },
      ), // ListView.separated
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}

