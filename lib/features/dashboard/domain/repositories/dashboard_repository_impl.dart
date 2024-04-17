
import 'package:http/http.dart';
import 'package:http/src/response.dart';

import 'dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl();

  @override
  Future<Response> fetchProducts({required String token}) async {
    Response result = await get(
      Uri.parse('https://dummyjson.com/products'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    return result;
  }

}
