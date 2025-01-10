import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:search_devs/domain/entities/dev.dart';

class DevApi {
  // Future<Dev?> getRepositoriesByUser(String userName) async {
  Future<Dev> getDev(String userName) async {
    Dev dev;
    String url = 'https://api.github.com/users/$userName';
    print("O QUE ESTA CHEGANDOOOO $url");
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("SATUS 200000");
      // final result = jsonDecode(response.body);
      // return result.map((json) => Dev.fromJson(json));
      final result = json.decode(utf8.decode(response.bodyBytes));
      print("RESUUUUULT $result");
      // dev = result.map((json) => Dev.fromJson(json));
      dev = Dev.fromJson(result);
      return dev;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}