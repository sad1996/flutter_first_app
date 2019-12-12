import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {

  String get trendingRepoUrl =>
      'https://github-trending-api.now.sh/repositories';

  Future<List<dynamic>> getTrendingRepos() async {
    List<dynamic> data;
    await http.get(trendingRepoUrl).then((response) {
      data = jsonDecode(response.body);
    });

    return data;
  }

}
