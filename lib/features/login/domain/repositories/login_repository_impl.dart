import 'dart:convert';

import 'package:http/http.dart' as http;

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl();

  @override
  Future<http.Response> login(
      {required String username, required String password}) async {
    http.Response result = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'expiresInMins': '30',
      }),
    );

    return result;
  }

  @override
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }
}
