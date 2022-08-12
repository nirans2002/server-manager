import 'package:flutter/material.dart';
import 'package:server_manager/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ServersPage(),
    );
  }
}
