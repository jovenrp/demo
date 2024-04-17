import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  const ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.stock,
    this.brand,
    this.thumbnail,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'price')
  final int? price;

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'stock')
  final int? stock;

  @JsonKey(name: 'brand')
  final String? brand;

  @JsonKey(name: 'thumbnail')
  final String? thumbnail;

  @JsonKey(name: 'images')
  final List<String>? images;

}
