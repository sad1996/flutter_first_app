import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/repositories.dart';

class TrendingReposPage extends StatefulWidget {
  @override
  _TrendingReposPageState createState() => _TrendingReposPageState();
}

class _TrendingReposPageState extends State<TrendingReposPage> {
  var connectivityResult;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    streamedConnectivity();
  }

  checkConnectivity() async {
    await Connectivity().checkConnectivity().then((result) {
      setState(() {
        connectivityResult = result;
      });
      print(connectivityResult.toString());
    });
  }

  streamedConnectivity() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
      print(connectivityResult.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FutureBuilder<List<Repo>>(
            future: getRepositiories(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return ListView.separated(
                  itemBuilder: (context, index) {
                    Repo repo = snapshot.data[index];
                    return ListTile(
                      title: Text(repo.name),
                      subtitle: Text(repo.author),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star),
                          Text(repo.stars.toString()),
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0.5,
                    );
                  },
                );
              else
                return Center(
                  child: Text('Loading...'),
                );
            },
          ),
          if (connectivityResult != null &&
              connectivityResult == ConnectivityResult.none)
            Container(
              color: Colors.white,
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
                  Text('No Internet Connection')
                ],
              ),
            )
        ],
      ),
    );
  }

  Future<List<Repo>> getRepositiories() async {
    return await http
        .get('https://github-trending-api.now.sh/repositories')
        .then((response) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      List<Repo> repoList = data.map((item) => Repo.fromJson(item)).toList();
      return repoList;
    });
  }
}
