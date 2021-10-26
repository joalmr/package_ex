import 'package:ejemplo_example/second-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: Text('Abrir pkg'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }),
      ),
    );
  }
}