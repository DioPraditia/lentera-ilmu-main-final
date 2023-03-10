// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class TransactionModel {
  final int id;
  final String trx_code;
  final String trx_type;
  final int user_buyer_id;
  final String user_buyer_name;
  final String user_buyer_phone;
  final int user_owner_id;
  final String user_owner_name;
  final String? referral_code;
  final int product_id;
  final String product_name;
  final int product_variant_id;
  final String product_variant_name;
  final int suplay_month;
  final String payment_partner;
  final String payment_type;
  final String? payment_provider;
  final String? payment_account_number;
  final String? payment_account_holder;
  final String payment_expired;
  final String address;
  final String photo;
  final String delivery_status_message;
  final String delivery_status;
  final String payment_status;
  final int base_price;
  final int platform_fee;
  final int bank_fee;
  final int unique_number;
  final int discount;
  final int selling_price;
  final int shipping_cost;
  final String approved_by;

  const TransactionModel({
    required this.id,
    required this.trx_code,
    required this.trx_type,
    required this.user_buyer_id,
    required this.user_buyer_name,
    required this.user_buyer_phone,
    required this.user_owner_id,
    required this.user_owner_name,
    this.referral_code,
    required this.product_id,
    required this.product_name,
    required this.product_variant_id,
    required this.product_variant_name,
    required this.suplay_month,
    required this.payment_partner,
    required this.payment_type,
    this.payment_provider,
    this.payment_account_number,
    this.payment_account_holder,
    required this.payment_expired,
    required this.address,
    required this.photo,
    required this.delivery_status_message,
    required this.delivery_status,
    required this.payment_status,
    required this.base_price,
    required this.platform_fee,
    required this.bank_fee,
    required this.unique_number,
    required this.discount,
    required this.selling_price,
    required this.shipping_cost,
    required this.approved_by,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
