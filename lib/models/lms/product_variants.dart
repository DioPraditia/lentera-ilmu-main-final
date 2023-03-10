// // // ignore_for_file: non_constant_identifier_names

// import 'package:json_annotation/json_annotation.dart';

// part 'product_variants.g.dart';

// // ignore_for_file: non_constant_identifier_names

// // class ProductVariants {
// //   int? id;
// //   DateTime? created_On;
// //   DateTime? modified_On;
// //   int? deleted;
// //   int? product_id;
// //   String? name;
// //   double? price;
// //   int? supply;
// //   String? description;

// //   ProductVariants({
// //     this.id,
// //     this.created_On,
// //     this.modified_On,
// //     this.deleted,
// //     this.product_id,
// //     this.name,
// //     this.price,
// //     this.supply,
// //     this.description,
// //   });

// //   ProductVariants.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     created_On = DateTime.parse(json['created_on']);
// //     modified_On = DateTime.parse(json['modified_on']);
// //     deleted = json['deleted'];
// //     product_id = json['product_id'];
// //     name = json['name'];
// //     price = double.parse(json['price'].toString());
// //     supply = json['supply'];
// //     description = json['description'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'created_on': created_On.toString(),
// //       'modified_on': modified_On.toString(),
// //       'deleted': deleted,
// //       'product_id': product_id,
// //       'name': name,
// //       'price': price,
// //       'supply': supply,
// //       'description': description,
// //     };
// //   }
// // }

// @JsonSerializable()
// class ProductVariants {
//   int? id;
//   String? created_On;
//   String? modified_On;
//   int? deleted;
//   int? product_id;
//   String? name;
//   String? price;
//   int? supply;
//   String? description;
//   String? size;

//   ProductVariants({
//     this.id,
//     this.created_On,
//     this.modified_On,
//     this.deleted,
//     this.product_id,
//     this.name,
//     this.price,
//     this.supply,
//     this.description,
//     this.size,
//   });

//   factory ProductVariants.fromJson(Map<String, dynamic> json) =>
//       _$ProductVariantsFromJson(json);

//   Map<String, dynamic> toJson() => _$ProductVariantsToJson(this);
// }
