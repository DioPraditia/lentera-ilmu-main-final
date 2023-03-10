import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class ShowroomVariantModel {
  final int id;
  final int showroom_id;
  final String name;
  final String price;
  final String? photo;
  final String? description;
  final int? height;
  final int? width;
  final int? length;
  final int? weight;

  ShowroomVariantModel({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.showroom_id,
    required this.name,
    required this.price,
    this.photo,
    this.description,
    this.height,
    this.width,
    this.length,
    this.weight,
  });

  factory ShowroomVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomVariantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomVariantModelToJson(this);
}
