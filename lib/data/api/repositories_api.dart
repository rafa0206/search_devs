import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:search_devs/domain/entities/repository.dart';

class RepositoriesApi {
  Future<List<Repository>> getRepositoriesByUser(String? userName,
      {String? type, String? sort, String? direction}) async {
    String url =
        'https://api.github.com/users/$userName/repos?type=$type&sort=$sort&direction=$direction&per_page=100';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((json) => Repository.fromJson(json))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}