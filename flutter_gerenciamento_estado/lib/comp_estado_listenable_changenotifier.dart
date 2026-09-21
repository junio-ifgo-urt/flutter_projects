import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CarrinhoPage()));
}

// Modelo que gerencia o estado do carrinho
class CarrinhoModel extends ChangeNotifier {
  final List<String> _itens = [];

  List<String> get itens => List.unmodifiable(_itens);

  void adicionarItem(String item) {
    _itens.add(item);
    notifyListeners(); // avisa os "ouvintes" que mudou
  }
}

class CarrinhoPage extends StatelessWidget {
  final CarrinhoModel carrinho = CarrinhoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrinho de Compras")),
      body: Column(
        children: [
          // Usamos ListenableBuilder para ouvir mudanças no carrinho
          Expanded(
            child: ListenableBuilder(
              listenable: carrinho,
              builder: (context, child) {
                if (carrinho.itens.isEmpty) {
                  return Center(child: Text("Carrinho vazio"));
                }
                return ListView.builder(
                  itemCount: carrinho.itens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(carrinho.itens[index]),
                    ); // ListTile
                  },
                ); // ListView.builder
              },
            ), // ListenableBuilder
          ), // Expanded
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                carrinho.adicionarItem(
                  "Item ${carrinho.itens.length + 1}",
                );
              },
              child: Text("Adicionar Item"),
            ), // ElevatedButton
          ), // Padding
        ],
      ), // Column
    ); // Scaffold
  }
}
