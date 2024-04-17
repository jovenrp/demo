import 'package:http/http.dart';

abstract class AddProductRepository {

  Future<Response> addProduct({required String token,
    required String title,
    required String description,
    required String price,
    required String rating,
    required String stock,
    required String brand,
    required String thumbnail,});
}
