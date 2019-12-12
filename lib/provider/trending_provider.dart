import 'package:flutter/material.dart';
import 'package:new_app/controller/api.dart';
import 'package:new_app/model/repositories.dart';

class TrendingProvider extends ChangeNotifier {
  TrendingProvider();

  List<Repo> repos = List();

  Future<List<Repo>> getRepositories() async {
    List<dynamic> jsonList = await Api().getTrendingRepos();
    repos = parseReposFromJson(jsonList);
    notifyListeners();
    return repos;
  }
}
