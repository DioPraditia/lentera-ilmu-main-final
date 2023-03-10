// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:lentera_ilmu/models/showroom/variant.dart';

part 'showroom.g.dart';

@JsonSerializable()
class ShowroomModel {
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
  final String? platform_fee;
  final List<ShowroomVariantModel> variants;

  ShowroomModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.creator_id,
      required this.creator_name,
      required this.category_id,
      required this.category_name,
      this.thumbnail,
      this.video,
      required this.address_id,
      this.platform_fee,
      required this.variants});

  factory ShowroomModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomModelToJson(this);
}
