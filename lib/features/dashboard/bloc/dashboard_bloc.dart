import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nrd/features/dashboard/bloc/dashboard_state.dart';
import 'package:nrd/features/dashboard/data/models/products_model.dart';
import 'package:nrd/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../../add_product/data/models/hive_product_model.dart';
import '../data/models/product_model.dart';


class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc({required this.dashboardRepository,}) : super(DashboardState());

  final DashboardRepository dashboardRepository;

  Future<void> fetchProducts(UserModel user) async {
    emit(state.copyWith(isFetchingProducts: true, hasError: false));

    print(user.token);
    final Response result = await dashboardRepository.fetchProducts(token: user.token ?? '');
    ProductsModel products = ProductsModel.fromJson(jsonDecode(result.body) as Map<String, dynamic>);

    if (result.statusCode == 200) {
      emit(state.copyWith(isFetchingProducts: false, hasError: false, products: products.products));
    } else {
      emit(state.copyWith(isFetchingProducts: false, hasError: true));
    }
    print(result.body);
    print(products.products);
  }

  Future<void> getLocalProducts() async {
    Box box = await Hive.openBox<HiveProductModel>('productBox');
    List<HiveProductModel> hiveProducts = box.values.toList() as List<HiveProductModel>;

    List<ProductModel>? productsModel = <ProductModel>[];

    for(ProductModel item in state.products ?? <ProductModel>[]) {
      ProductModel product = ProductModel(
        title: item.title,
        description: item.description,
        price: item.price,
        rating: item.rating,
        stock: item.stock,
        brand: item.brand,
        thumbnail: item.thumbnail,
      );
      productsModel.add(item);
    }

    for(HiveProductModel item in hiveProducts) {
      ProductModel product = ProductModel(
        title: item.title,
        description: item.description,
        price: item.price,
        rating: item.rating,
        stock: item.stock,
        brand: item.brand,
        thumbnail: item.thumbnail,
      );
      productsModel.add(product);
    }
    emit(state.copyWith(isFetchingProducts: false, hasError: false, products: productsModel));
  }
}