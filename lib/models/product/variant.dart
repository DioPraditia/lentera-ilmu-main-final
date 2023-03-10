import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class ProductVariantModel {
  final int id;
  final int product_id;
  final String name;
  final int stock;
  final String price;
  final String? condition;
  final String? photo;
  final String? description;
  final int? height;
  final int? width;
  final int? length;
  final int? weight;

  ProductVariantModel({
    required this.id,
    required this.product_id,
    required this.name,
    required this.price,
    required this.stock,
    required this.condition,
    this.photo,
    this.description,
    this.height,
    this.width,
    this.length,
    this.weight,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantModelToJson(this);
}
