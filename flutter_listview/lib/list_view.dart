import 'package:flutter/material.dart';

class ListViewExemplo extends StatelessWidget {
  const ListViewExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: const <Widget>[
        CircleAvatar(
          maxRadius: 50,
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white, size: 50),
        ), // CircleAvatar
        ListTile(leading: Icon(Icons.map), title: Text('Map')),
        ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
        ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
      ],
    );
  }
}