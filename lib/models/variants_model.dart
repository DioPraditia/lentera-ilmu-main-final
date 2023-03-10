// // // ignore_for_file: non_constant_identifier_names

// class VariantsModel {
//   final int id;
//   final String createdOn;
//   final String? modifiedOn;
//   final int deleted;
//   final int productId;
//   final String name;
//   final String price;
//   final int? supply;
//   final String description;
//   final String? photo;
//   final String? size;

//   VariantsModel({
//     required this.id,
//     required this.createdOn,
//     required this.modifiedOn,
//     required this.deleted,
//     required this.productId,
//     required this.name,
//     required this.price,
//     required this.supply,
//     required this.description,
//     required this.photo,
//     required this.size,
//   });

//   factory VariantsModel.fromJson(Map<String, dynamic> json) {
//     return VariantsModel(
//         id: json['id'],
//         createdOn: json['created_on'],
//         modifiedOn: json['modified_on'],
//         deleted: json['deleted'],
//         productId: json['product_id'],
//         name: json['name'],
//         price: json['price'],
//         supply: json['supply'],
//         description: json['description'],
//         photo: json['photo'],
//         size: json['size']);
//   }
// }
