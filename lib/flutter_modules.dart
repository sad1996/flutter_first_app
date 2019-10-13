import 'package:flutter/material.dart';
import 'package:new_app/forms_page.dart';
import 'package:new_app/home_page.dart';
import 'package:new_app/login_page.dart';
import 'package:new_app/tabs_page.dart';

class FlutterModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: FlutterLogo(
            colors: Colors.pink,
          ),
        ),
        title: Text('Flutter Examples'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            title: Text('Example 1'),
            subtitle: Text('List & Conditions'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'example2');
            },
            title: Text('Example 2'),
            subtitle: Text('Forms & Text Fields'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(
                            'Tabs',
                            name: 'Sadak',
                          )));
            },
            title: Text('Example 3'),
            subtitle: Text('Tabs, Routes & Navigations'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
          ListTile(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => LoginPage(),
                ),
              );
            },
            title: Text('Example 4'),
            subtitle: Text('Cupertino View & Login'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
        ],
      ),
    );
  }
}
