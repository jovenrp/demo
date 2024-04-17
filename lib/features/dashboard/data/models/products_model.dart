import 'package:json_annotation/json_annotation.dart';
import 'package:nrd/features/dashboard/data/models/product_model.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  const ProductsModel({
    this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

  @JsonKey(name: 'products')
  final List<ProductModel>? products;

}
