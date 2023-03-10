// // // ignore_for_file: non_constant_identifier_names

// // import 'package:json_annotation/json_annotation.dart';
// // import 'package:lentera_ilmu/models/lms/product_variants.dart';

// // part 'product_franchise.g.dart';

// // ignore_for_file: non_constant_identifier_names

// class ProductFranchise {
//   int? id;
//   DateTime? created_On;
//   DateTime? modified_On;
//   int? deleted;
//   String? name;
//   String? detail;
//   String? address;
//   int? creator_id;
//   String? creator_name;

//   ProductFranchise({
//     this.id,
//     this.created_On,
//     this.modified_On,
//     this.deleted,
//     this.name,
//     this.detail,
//     this.address,
//     this.creator_id,
//     this.creator_name,
//   });

//   ProductFranchise.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     created_On = DateTime.parse(json['created_on']);
//     modified_On = DateTime.parse(json['modified_on']);
//     deleted = json['deleted'];
//     name = json['name'];
//     detail = json['detail'];
//     address = json['address'];
//     creator_id = json['creator_id'];
//     creator_name = json['creator_name'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'created_on': created_On.toString(),
//       'modified_on': modified_On.toString(),
//       'deleted': deleted,
//       'name': name,
//       'detail': detail,
//       'address': address,
//       'creator_id': creator_id,
//       'creator_name': creator_name,
//     };
//   }
// }
// // @JsonSerializable()
// // class ProductFranchise {
// //   int? id;
// //   String? created_On;
// //   String? modified_On;
// //   int? deleted;
// //   String? name;
// //   String? detail;
// //   String? address;
// //   int? creator_id;
// //   String? creator_name;
// //   List<ProductVariants>? variants;

// //   ProductFranchise({
// //     this.id,
// //     this.created_On,
// //     this.modified_On,
// //     this.deleted,
// //     this.name,
// //     this.detail,
// //     this.address,
// //     this.creator_id,
// //     this.creator_name,
// //   });

// //   factory ProductFranchise.fromJson(Map<String, dynamic> json) =>
// //       _$ProductFranchiseFromJson(json);

// //   Map<String, dynamic> toJson() => _$ProductFranchiseToJson(this);
// // }
