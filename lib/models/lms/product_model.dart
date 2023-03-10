// // ignore_for_file: non_constant_identifier_names

// import 'package:json_annotation/json_annotation.dart';
// import 'package:lentera_ilmu/core.dart';
// // import 'package:lentera_ilmu/models/lms/product_franchise.dart';
// import 'package:lentera_ilmu/models/lms/product_variants.dart';

// part 'product_model.g.dart';

// // import 'package:lentera_ilmu/core.dart';
// // // import 'package:lentera_ilmu/models/lms/product_franchise.dart';
// // import 'package:lentera_ilmu/models/lms/product_variants.dart';

// // class ProductModel {
// //   int? id;
// //   DateTime? created_On;
// //   DateTime? modified_On;
// //   int? deleted;
// //   String? name;
// //   String? description;
// //   int? category_id;
// //   int? address_id;
// //   String? category_name;
// //   int? creator_id;
// //   String? creator_name;
// //   String? thumbnail;
// //   String? photo;
// //   String? video;
// //   String? status;
// //   String? status_confirmation;
// //   String? prerequisite;
// //   String? platform_fee;
// //   SharingFeeModel? sharing_fee;
// //   // String? size;
// //   // bool? insurance;
// //   // bool? is_have_variant;
// //   String? franchise;
// //   // ProductFranchise? franchise;
// //   List<ProductVariants>? variants;

// //   ProductModel({
// //     this.id,
// //     this.created_On,
// //     this.modified_On,
// //     this.deleted,
// //     this.name,
// //     this.description,
// //     this.category_id,
// //     this.address_id,
// //     this.category_name,
// //     this.creator_id,
// //     this.creator_name,
// //     this.thumbnail,
// //     this.photo,
// //     this.video,
// //     this.status,
// //     this.status_confirmation,
// //     this.prerequisite,
// //     this.platform_fee,
// //     this.sharing_fee,
// //     // this.size,
// //     // this.insurance,
// //     // this.is_have_variant,
// //     this.franchise,
// //     this.variants,
// //   });

// //   ProductModel.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     created_On = DateTime.parse(json['created_on']);
// //     modified_On = DateTime.parse(json['modified_on']);
// //     deleted = json['deleted'];
// //     name = json['name'];
// //     description = json['description'];
// //     category_id = json['category_id'];
// //     address_id = json['address_id'];
// //     category_name = json['category_name'];
// //     creator_id = json['creator_id'];
// //     creator_name = json['creator_name'];
// //     thumbnail = json['thumbnail'];
// //     photo = json['photo'];
// //     video = json['video'];
// //     status = json['status'];
// //     status_confirmation = json['status_confirmation'];
// //     prerequisite = json['prerequisite'];
// //     platform_fee = json['platform_fee'];
// //     sharing_fee = SharingFeeModel.fromJson(json['sharing_fee']);
// //     // sharing_fee = json['sharing_fee'];
// //     // size = json['size'];
// //     // insurance = json['insurance'];
// //     // is_have_variant = json['is_have_variant'];
// //     // franchise = ProductFranchise.fromJson(json['franchise']);
// //     franchise = json['franchise'];
// //     variants = json['variants']
// //         .map<ProductVariants>((variants) => ProductVariants.fromJson(variants))
// //         .toList();
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'created_on': created_On.toString(),
// //       'modified_on': modified_On.toString(),
// //       'deleted': deleted,
// //       'name': name,
// //       'description': description,
// //       'category_id': category_id,
// //       'address_id': address_id,
// //       'category_name': category_name,
// //       'creator_id': creator_id,
// //       'creator_name': creator_name,
// //       'thumbnail': thumbnail,
// //       'photo': photo,
// //       'video': video,
// //       'status': status,
// //       'status_confirmation': status_confirmation,
// //       'prerequisite': prerequisite,
// //       'platform_fee': platform_fee,
// //       'sharing_fee': sharing_fee?.toJson(),
// //       // 'sharing_fee': sharing_fee,
// //       // 'size': size,
// //       // 'insurance': insurance,
// //       // 'is_have_variant': is_have_variant,
// //       // 'franchise': franchise?.toJson(),
// //       'franchise': franchise,
// //       'variants': variants?.map((variants) => variants.toJson()).toList(),
// //     };
// //   }
// // }
// @JsonSerializable()
// class ProductModel {
//   int? id;
//   String? created_On;
//   String? modified_On;
//   int? deleted;
//   String? name;
//   String? description;
//   int? category_id;
//   String? category_name;
//   int? creator_id;
//   int? address_id;
//   String? creator_name;
//   String? thumbnail;
//   String? photos;
//   String? video;
//   String? status;
//   String? status_confirmation;
//   String? status_confirmation_message;
//   String? prerequisite;
//   String? platform_fee;
//   SharingFeeModel? sharing_fee;
//   String? franchise;
//   // String? size;
//   // bool? insurance;
//   // bool? is_have_variant;
//   // String? franchise;
//   List<ProductVariants>? variants;

//   ProductModel({
//     this.id,
//     this.created_On,
//     this.modified_On,
//     this.deleted,
//     this.name,
//     this.description,
//     this.category_id,
//     this.category_name,
//     this.creator_id,
//     this.address_id,
//     this.creator_name,
//     this.thumbnail,
//     this.photos,
//     this.video,
//     this.status,
//     this.status_confirmation,
//     this.prerequisite,
//     this.platform_fee,
//     this.sharing_fee,
//     // this.size,
//     // this.insurance,
//     // this.is_have_variant,
//     this.franchise,
//     this.status_confirmation_message,
//     this.variants,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) =>
//       _$ProductModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ProductModelToJson(this);
// }
