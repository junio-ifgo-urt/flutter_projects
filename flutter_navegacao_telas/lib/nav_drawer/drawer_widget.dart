import 'package:flutter/material.dart';

// Novo widget para o menu lateral (Drawer)
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Drawer Header'),
          ), // DrawerHeader
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
              Navigator.pop(context);
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Business'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
              Navigator.pop(context);
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('School'),
            selected: selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
              Navigator.pop(context);
            },
          ), // ListTile
        ],
      ), // ListView
    ); // Drawer
  }
}