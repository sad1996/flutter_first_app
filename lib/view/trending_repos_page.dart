import 'package:flutter/material.dart';
import 'package:new_app/provider/trending_provider.dart';
import 'package:provider/provider.dart';

import '../model/repositories.dart';

class TrendingReposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
      ),
      body: FutureBuilder<List<Repo>>(
        future: Provider.of<TrendingProvider>(context).getRepositories(),
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
    );
  }
}
