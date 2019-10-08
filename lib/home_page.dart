import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:new_app/favourite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WordPair> englishWords = new List();
  List<WordPair> favouriteWords = new List();

  @override
  void initState() {
    super.initState();
    englishWords = generateWordPairs().take(20).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'English Words',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => FavouritePage(
                            favouriteList: favouriteWords,
                          )));
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            WordPair wordItem = englishWords[index];
            return ListTile(
              title: Text(wordItem.asPascalCase),
              trailing: favouriteWords.contains(wordItem)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border),
              onTap: () {
                setState(() {
                  if (favouriteWords.contains(wordItem))
                    favouriteWords.remove(wordItem);
                  else
                    favouriteWords.add(wordItem);
                });
                print(favouriteWords.length);
              },
            );
          },
          itemCount: englishWords.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
