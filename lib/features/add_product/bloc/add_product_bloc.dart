import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:nrd/features/add_product/bloc/add_product_state.dart';
import 'package:nrd/features/add_product/domain/repositories/add_product_repository.dart';


class AddProductBloc extends Cubit<AddProductState> {
  AddProductBloc({
    required this.addProductRepository,
  }) : super(AddProductState());

  final AddProductRepository addProductRepository;

  Future<void> addProducts({
    String? token,
    String? title,
    String? description,
    String? brand,
    String? price,
    String? rating,
    String? stock,
    String? imageLink,
  }) async {
    emit(state.copyWith(isAddingProducts: true, hasError: false));

    final Response result = await addProductRepository.addProduct(
      token: token ?? '',
      title: title ?? '',
      description: description ?? '',
      brand: brand ?? '',
      price: price ?? '',
      rating: rating ?? '',
      stock: stock ?? '',
      thumbnail: imageLink ?? '',
    );

    print(result.body);
  }
}
