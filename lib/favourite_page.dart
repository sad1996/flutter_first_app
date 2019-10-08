import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key key, this.favouriteList}) : super(key: key);

  final List<WordPair> favouriteList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            WordPair wordItem = favouriteList[index];
            return ListTile(
              title: Text(wordItem.asPascalCase),
              trailing: Icon(Icons.favorite, color: Colors.red),
            );
          },
          itemCount: favouriteList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
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
}
