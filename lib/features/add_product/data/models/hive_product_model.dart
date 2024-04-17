import 'package:hive/hive.dart';

part 'hive_product_model.g.dart';

@HiveType(typeId: 1)
class HiveProductModel {
  HiveProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.thumbnail,
  });

  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final int? price;

  @HiveField(3)
  final double? rating;

  @HiveField(4)
  final int? stock;

  @HiveField(5)
  final String? brand;

  @HiveField(6)
  final String? thumbnail;

  @override
  String toString() {
    return '$title: $description';
  }
}
