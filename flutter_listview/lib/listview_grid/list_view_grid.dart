import 'package:flutter/material.dart';
import 'card_view_model.dart';

class ListViewGrid extends StatelessWidget {
  const ListViewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // cria grid com 2 colunas,pois está na vertical
      crossAxisCount: 2,
      //scrollDirection: Axis.horizontal,
      // define os elementos
      children: [
        CustomCard(title: "Map", icon: Icons.map, color: Colors.red),
        CustomCard(title: "Album", icon: Icons.photo_album, color: Colors.green),
        CustomCard(title: "Phone", icon: Icons.phone, color: Colors.blueAccent),
        CustomCard(title: "Map", icon: Icons.map, color: Colors.red),
        CustomCard(title: "Album", icon: Icons.photo_album, color: Colors.green),
        CustomCard(title: "Phone", icon: Icons.phone, color: Colors.blueAccent),
        CustomCard(title: "Map", icon: Icons.map, color: Colors.red),
        CustomCard(title: "Album", icon: Icons.photo_album, color: Colors.green),
        CustomCard(title: "Phone", icon: Icons.phone, color: Colors.blueAccent),
      ],
    ); // GridView
  }
}

