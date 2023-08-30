import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title : const Text("Minhas Imagens")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hello'),
      ),
    ),
  );
  runApp(app);
}
