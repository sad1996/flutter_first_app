import 'package:flutter/material.dart';
import 'package:new_app/forms_page.dart';
import 'package:new_app/home_page.dart';
import 'package:new_app/tabs_page.dart';
import 'flutter_modules.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo, primaryColor: Colors.indigo),
      routes: Map<String, WidgetBuilder>.from({
        'example1': (context) => HomePage(),
        'example2': (context) => FormsPage(),
        'example3': (context) => TabsPage('Tabs'),
      }),
      home: FlutterModule(),
    );
  }
}
