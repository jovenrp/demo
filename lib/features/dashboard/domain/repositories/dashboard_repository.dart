import 'package:http/http.dart';

abstract class DashboardRepository {

  Future<Response> fetchProducts({required String token});
}
