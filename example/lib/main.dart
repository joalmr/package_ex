import 'package:ejemplo_example/second-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: TextButton(
            child: Text('Abrir pkg'),
            onPressed: () {
              // Navigator.of(context).push(route);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          ),
        ),
      ),
      //
    );
  }
}
