import 'package:http/http.dart';

abstract class LoginRepository {
  Future<Response> login({required String username, required String password});

  Future<Response> fetchAlbum();
}
