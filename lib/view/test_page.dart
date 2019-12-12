import 'package:flutter/material.dart';
import 'package:new_app/provider/test_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (context, testProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider Example'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestPage()));
                },
              )
            ],
          ),
          body: Center(
            child: Text(
              testProvider.cartCount.toString(),
              style: Theme.of(context).textTheme.display3,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: testProvider.incrementCartCount,
          ),
        );
      },
    );
  }
}
