import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: 160, color: Colors.red,
              child: ListTile(leading: Icon(Icons.map), title: Text('Map'))),
          Container(width: 160, color: Colors.green,
              child: ListTile(leading: Icon(Icons.photo_album), title: Text('Album'))),
          Container(width: 160, color: Colors.blueAccent,
              child: ListTile(leading: Icon(Icons.phone), title: Text('Phone'))),
        ], // <Widget>[]
      ), // ListView
    ); // Container
  }
}