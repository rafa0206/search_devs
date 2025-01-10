import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:search_devs/domain/entities/dev.dart';

class DevApi {
  Future<Dev> getDev(String userName) async {
    Dev dev;
    String url = 'https://api.github.com/users/$userName';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = json.decode(utf8.decode(response.bodyBytes));
      dev = Dev.fromJson(result);
      return dev;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}