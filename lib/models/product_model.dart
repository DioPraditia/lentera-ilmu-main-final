// import 'package:lentera_ilmu/models/franchise_model.dart';
// import 'package:lentera_ilmu/models/variants_model.dart';

// class ProductModel {
//   final int id;
//   final String createdOn;
//   final String modifiedOn;
//   final int deleted;
//   final String name;
//   final String description;
//   final int creatorId;
//   final int addressId;
//   final String creatorName;
//   final int categoryId;
//   final String categoryName;
//   final String thumbnail;
//   final String? video;
//   final String status;
//   final String? status_confirmation;
//   final String? status_confirmation_message;
//   final String? prerequisite;
//   final String platform_fee;
//   final String sharing_fee;
//   final FranchiseModel? franchise;
//   final List<VariantsModel> variants;

//   ProductModel({
//     required this.id,
//     required this.createdOn,
//     required this.modifiedOn,
//     required this.deleted,
//     required this.name,
//     required this.description,
//     required this.creatorId,
//     required this.addressId,
//     required this.creatorName,
//     required this.categoryId,
//     required this.categoryName,
//     required this.thumbnail,
//     required this.video,
//     required this.status,
//     required this.status_confirmation,
//     required this.status_confirmation_message,
//     required this.prerequisite,
//     required this.platform_fee,
//     required this.sharing_fee,
//     required this.franchise,
//     required this.variants,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//         id: json['id'],
//         createdOn: json['created_on'],
//         modifiedOn: json['modified_on'],
//         deleted: json['deleted'],
//         name: json['name'],
//         description: json['description'],
//         creatorId: json['creator_id'],
//         addressId: json['address_id'],
//         creatorName: json['creator_name'],
//         categoryId: json['category_id'],
//         categoryName: json['category_name'],
//         thumbnail: json['thumbnail'],
//         video: json['video'],
//         status: json['status'],
//         status_confirmation: json['status_confirmation'],
//         status_confirmation_message: json['status_confirmation_message'],
//         prerequisite: json['prerequisite'],
//         platform_fee: json['platform_fee'],
//         sharing_fee: json['sharing_fee'],
//         franchise: FranchiseModel.fromJson(json['franchise']),
//         variants: (json['variants'] as List<dynamic>)
//             .map((e) => VariantsModel.fromJson(e as Map<String, dynamic>))
//             .toList());
//   }

//   // ProductModel.fromJson(Map<String, dynamic> json) {
//   //   id = json['id'];
//   //   createdOn = DateTime.parse(json['created_on']);
//   //   modifiedOn = DateTime.parse(json['modified_on']);
//   //   deleted = json['deleted'];
//   //   name = json['name'];
//   //   description = json['description'];
//   //   creatorId = json['creator_id'];
//   //   addressId = json['address_id'];
//   //   creatorName = json['creator_name'];
//   //   categoryId = json['category_id'];
//   //   categoryName = json['category_name'];
//   //   thumbnail = json['thumbnail'];
//   //   photo = json['photos'];
//   //   video = json['video'];
//   //   status = json['status'];
//   //   status_confirmation = json['status_confirmation'];
//   //   status_confirmation_message = json['status_confirmation_message'];
//   //   prerequisite = json['prerequisite'];
//   //   platform_fee = double.parse(json['platform_fee'].toString());
//   //   sharing_fee = json['sharing_fee'];
//   //   franchise = json['franchise'];
//   //   variants = json['variants']
//   //       .map<VariantsModel>((variants) => VariantsModel.fromJson(variants))
//   //       .toList();
//   // }
//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'created_on': createdOn.toString(),
//   //     'modified_on': modifiedOn.toString(),
//   //     'deleted': deleted,
//   //     'name': name,
//   //     'description': description,
//   //     'creator_id': creatorId,
//   //     'address_id': addressId,
//   //     'creator_name': creatorName,
//   //     'category_id': categoryId,
//   //     'category_name': categoryName,
//   //     'thumbnail': thumbnail,
//   //     'photos': photo,
//   //     'video': video,
//   //     'status': status,
//   //     'status_confirmation': status_confirmation,
//   //     'status_confirmation_message': status_confirmation_message,
//   //     'prerequisite': prerequisite,
//   //     'platform_fee': platform_fee,
//   //     'sharing_fee': sharing_fee,
//   //     'franchise': franchise,
//   //     'variants': variants?.map((variants) => variants.toJson()).toList(),
//   //   };
//   // }
// }
