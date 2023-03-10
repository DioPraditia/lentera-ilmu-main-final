// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'franchise.g.dart';

@JsonSerializable()
class FranchiseModel {
  final int id;
  final int creator_id;
  final String? creatror_name;
  final String name;
  final String detail;

  FranchiseModel({
    required this.id,
    required this.name,
    required this.detail,
    required this.creator_id,
    required this.creatror_name,
  });

  factory FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseModelToJson(this);
}
