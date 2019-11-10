import 'package:flutter/material.dart';
import 'package:new_app/view/forms_page.dart';
import 'package:new_app/view/home_page.dart';
import 'package:new_app/view/tabs_page.dart';
import 'view/flutter_modules.dart';

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
