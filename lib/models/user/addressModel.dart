// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'addressModel.g.dart';

@JsonSerializable()
class AddressModel {
  final int id;
  final int user_id;
  final String? phone;
  final int? province_id;
  final String? province_name;
  final int? city_id;
  final String? city_name;
  final String? postal_code;
  final String? detail;

  AddressModel(
      this.id,
      this.user_id,
      this.phone,
      this.province_id,
      this.province_name,
      this.city_id,
      this.city_name,
      this.postal_code,
      this.detail);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
