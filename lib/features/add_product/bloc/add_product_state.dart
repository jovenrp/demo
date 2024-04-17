import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../../dashboard/data/models/products_model.dart';

part 'add_product_state.freezed.dart';

@freezed
class AddProductState with _$AddProductState {
  factory AddProductState(
      {@Default(false) bool isLoading,
        @Default(false) bool hasError,
        @Default(false) bool isAddingProducts,
        UserModel? userModel,
        ProductsModel? product,
        String? errorMessage,}) = _AddProductState;
}
