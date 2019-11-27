import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else
      return ListView();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
