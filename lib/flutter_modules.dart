import 'package:flutter/material.dart';
import 'package:new_app/forms_page.dart';
import 'package:new_app/home_page.dart';
import 'package:new_app/login_page.dart';
import 'package:new_app/tabs_page.dart';

import 'trending_repos_page.dart';

class FlutterModule extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: FlutterLogo(
            colors: Colors.yellow,
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
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => LoginPage(),
                ),
              );
            },
            title: Text('Example 4'),
            subtitle: Text('Cupertino Dialog & Login'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
          ListTile(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TrendingReposPage(),
                ),
              );
            },
            title: Text('Example 5'),
            subtitle: Text('HTTP'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(height: 0.5),
        ],
      ),
    );
  }
}
