import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:search_devs/domain/entities/repository.dart';

class RepositoriesApi {
  Future<List<Repository>> getRepositoriesByUser(String userName) async {
    String url = 'https://api.github.com/users/$userName/repos';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((json) => Repository.fromJson(json))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}