import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrd/features/dashboard/data/models/product_model.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../data/models/products_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState(
      {@Default(false) bool isLoading,
        @Default(false) bool hasError,
        @Default(false) bool isFetchingProducts,
        UserModel? userModel,
        ProductsModel? product,
        List<ProductModel>? products,
        String? errorMessage,}) = _DashboardState;
}
