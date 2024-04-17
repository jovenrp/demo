import 'dart:convert';
import 'dart:math';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nrd/features/add_product/data/models/hive_product_model.dart';
import 'package:nrd/features/add_product/domain/repositories/add_product_repository.dart';

class AddProductRepositoryImpl extends AddProductRepository {
  AddProductRepositoryImpl();

  @override
  Future<Response> addProduct({
    required String token,
    required String title,
    required String description,
    required String price,
    required String rating,
    required String stock,
    required String brand,
    required String thumbnail,
  }) async {
    Response result = await post(
      Uri.parse('https://dummyjson.com/products/add'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'price': price,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'thumbnail': thumbnail,
      }),
    );

    if (result.statusCode == 200) {
      Box box = await Hive.openBox<HiveProductModel>('productBox');
      HiveProductModel hiveProductModel = HiveProductModel(title: title,
          description: description,
          price: int.parse(price),
          rating: double.parse(rating),
          stock: int.parse(stock),
          brand: brand,
          thumbnail: thumbnail);

      await box.put(Random().nextInt(99999), hiveProductModel);
    }

    return result;
  }
}
