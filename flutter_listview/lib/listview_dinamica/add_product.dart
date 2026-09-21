import 'package:flutter/material.dart';
import '../listview_builder/produto.dart';

/*
@data: 18/09/25
@author: Júnio Lima

Tela para cadastrar um novo produto
*/
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  IconData _selectedIcon = Icons.shopping_bag;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    final name = _nameController.text.trim();
    final priceText = _priceController.text.trim().replaceAll(',', '.');

    if (name.isEmpty || priceText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos")),
      );
      return;
    }

    final parsedPrice = double.tryParse(priceText);
    if (parsedPrice == null || parsedPrice <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preço inválido")),
      );
      return;
    }

    final product = Product(
      name: name,
      price: parsedPrice,
      icon: _selectedIcon,
    );

    Navigator.pop(context, product);
  } // end _saveProduct

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Produto"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nome do produto",
              ), // InputDecoration
            ), // TextField
            TextField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Preço (ex: 1234.56)",
              ), // InputDecoration
            ), // TextField
            const SizedBox(height: 20),
            DropdownButton<IconData>(
              value: _selectedIcon,
              items: const [
                DropdownMenuItem(value: Icons.shopping_bag, child: Text("Sacola")),
                DropdownMenuItem(value: Icons.phone_iphone, child: Text("Smartphone")),
                DropdownMenuItem(value: Icons.laptop_mac, child: Text("Notebook")),
                DropdownMenuItem(value: Icons.watch, child: Text("Relógio")),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedIcon = value ?? Icons.shopping_bag;
                });
              },
            ), // DropdownButton
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveProduct,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Salvar"),
            ), // ElevatedButton
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
