import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:new_app/provider/connectivity_provider.dart';
import 'package:new_app/provider/test_provider.dart';
import 'package:new_app/view/forms_page.dart';
import 'package:new_app/view/home_page.dart';
import 'package:new_app/view/tabs_page.dart';
import 'package:provider/provider.dart';

import 'provider/trending_provider.dart';
import 'view/flutter_modules.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TrendingProvider()),
      ChangeNotifierProvider(create: (_) => TestProvider()),
      ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
    ], child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, connectivity, _) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.indigo, primaryColor: Colors.indigo),
                routes: Map<String, WidgetBuilder>.from({
                  'example1': (context) => HomePage(),
                  'example2': (context) => FormsPage(),
                  'example3': (context) => TabsPage('Tabs'),
                }),
                home: FlutterModule(),
              ),
              if (connectivity.connectivityResult != null &&
                  connectivity.connectivityResult == ConnectivityResult.none)
                Container(
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.signal_wifi_off,
                        size: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Internet Connection',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
