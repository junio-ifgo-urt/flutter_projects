import 'package:flutter/material.dart';
import 'package:flutter_listview/listview_grid/list_view_grid.dart';
import 'package:flutter_listview/listview_builder/list_view_builder.dart';

import 'listview_separated/listview_separated.dart';
//import 'package:flutter_listview/list_view.dart';
//import 'list_view_horizontal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Widget raiz da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos de ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // ThemeData
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ); // MaterialApp
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ListView",
          ), // Text
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ), // AppBar
        body: Container(
          child: ProductListScreenSeparated(),
          //child: ListViewBuilder(),
          //child: ListViewGrid(),
          //child: ListViewHorizontal(),
          //child: ListViewGrid(),
        ), // Container
    ); // Scaffold
  }
}