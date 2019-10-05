import 'package:flutter/material.dart';
import 'package:new_app/forms_page.dart';
import 'package:new_app/home_page.dart';

class FlutterModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            title: Text('Example 1'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormsPage()));
            },
            title: Text('Example 2'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
