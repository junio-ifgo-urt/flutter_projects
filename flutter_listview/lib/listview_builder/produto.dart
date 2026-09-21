import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final IconData icon;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
  });

  // Método estático para gerar uma lista de produtos mutavel
  static List<Product> generateProducts() {
    return [
      const Product(name: "Notebook Gamer", price: 5500.00, icon: Icons.laptop_mac),
      const Product(name: "Smartphone Pro", price: 4500.00, icon: Icons.phone_iphone),
      const Product(name: "Fone de Ouvido sem Fio", price: 250.00, icon: Icons.bluetooth_audio),
      const Product(name: "Monitor Ultrawide", price: 1200.00, icon: Icons.desktop_windows),
      const Product(name: "Mouse Ergonômico", price: 180.00, icon: Icons.mouse),
      const Product(name: "Teclado Mecânico RGB", price: 450.00, icon: Icons.keyboard_alt),
      const Product(name: "Webcam HD", price: 200.00, icon: Icons.videocam),
      const Product(name: "Microfone de Estúdio", price: 600.00, icon: Icons.mic),
      const Product(name: "Impressora Multifuncional", price: 800.00, icon: Icons.print),
      const Product(name: "Tablet", price: 1800.00, icon: Icons.tablet_android),
      const Product(name: "Smartwatch", price: 950.00, icon: Icons.watch),
      const Product(name: "Câmera Digital", price: 2500.00, icon: Icons.camera_alt),
      const Product(name: "Caixa de Som Portátil", price: 300.00, icon: Icons.speaker),
      const Product(name: "Projetor", price: 3200.00, icon: Icons.videogame_asset),
      const Product(name: "Console de Jogos", price: 2800.00, icon: Icons.sports_esports),
      const Product(name: "Roteador Wi-Fi 6", price: 500.00, icon: Icons.router),
      const Product(name: "Leitor de E-book", price: 750.00, icon: Icons.book),
      const Product(name: "HD Externo SSD", price: 550.00, icon: Icons.save),
      const Product(name: "Carregador Portátil", price: 120.00, icon: Icons.battery_charging_full),
      const Product(name: "Adaptador USB-C", price: 80.00, icon: Icons.usb),
    ];
  }
}