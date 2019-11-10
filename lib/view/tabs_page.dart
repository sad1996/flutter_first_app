import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage(this.title, {this.name});

  final String title;
  final String name;

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            labelColor: Colors.blue,
            tabs: <Widget>[
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Calls',
              )
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: <Widget>[tab1(), tab2(), tab3()],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.pop(context); // 1 Screen Back
          Navigator.popUntil(
              context, (route) => route.isFirst); // Comes to first screen
        },
        label: Text('Exit to Home'),
      ),
    );
  }

  Widget tab1() {
    return Center(
      child: Text('Tab 1'),
    );
  }

  Widget tab2() {
    return Center(
      child: Text('Tab 2'),
    );
  }

  Widget tab3() {
    return Center(
      child: Text('Tab 3'),
    );
  }
}
