import 'package:flutter/material.dart';
import 'flutter_modules.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue),
      home: FlutterModule(),
    );
  }
}
