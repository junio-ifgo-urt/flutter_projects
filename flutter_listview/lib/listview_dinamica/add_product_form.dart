
import 'package:flutter/material.dart';

import '../listview_builder/produto.dart';

/*
@data: 18/09/25
@author: Júnio Lima

Tela para cadastrar um novo produto usando Formulário com validação
*/
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  IconData _selectedIcon = Icons.shopping_bag;

  @override
  void dispose() {
    // sempre dispôr controllers para evitar leaks
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // aceitar vírgula como separador decimal (por conveniência do usuário)
      final raw = _priceController.text.replaceAll(',', '.');
      final parsed = double.tryParse(raw) ?? 0.0;
      print("Preço: $parsed");

      final product = Product(
        name: _nameController.text,
        //price: double.tryParse(_priceController.text) ?? 0,
        price: parsed,
        icon: _selectedIcon,
      );
      // retorna o produto para a tela anterior
      Navigator.pop(context, product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Produto"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nome do produto"),
                validator: (value) => value == null || value.isEmpty
                    ? "Informe o nome"
                    : null,
              ), // TextFormField
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Preço (ex: 1234.56)"),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Informe o preço";
                  }
                  final raw = value.replaceAll(',', '.');
                  final parsed = double.tryParse(raw);
                  if (parsed == null) return "Preço inválido";
                  if (parsed <= 0) return "Informe um preço maior que zero";
                  return null;
                },
              ), // TextFormField
              const SizedBox(height: 20),
              DropdownButtonFormField<IconData>(
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
                decoration: const InputDecoration(labelText: "Ícone"),
              ), // DropdownButtonFormField
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveProduct,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Salvar"),
              ), // ElevatedButton
            ],
          ), // Column
        ), // Form
      ), // Padding
    ); // Scaffold
  }
}
