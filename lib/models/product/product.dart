// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:lentera_ilmu/models/product/franchise.dart';
import 'package:lentera_ilmu/models/product/variant.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String description;
  final int creator_id;
  final String creator_name;
  final int category_id;
  final String category_name;
  final String? thumbnail;
  final String? video;
  final int address_id;
  final String platform_fee;
  final List<ProductVariantModel> variants;
  final FranchiseModel? franchise;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.creator_id,
      required this.creator_name,
      required this.category_id,
      required this.category_name,
      required this.thumbnail,
      required this.video,
      required this.address_id,
      required this.platform_fee,
      required this.franchise,
      required this.variants});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
