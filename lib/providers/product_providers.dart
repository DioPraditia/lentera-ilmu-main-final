// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:lentera_ilmu/models/product_model.dart';

// // class ProductProvider extends ChangeNotifier {
// //   Future<List<ProductModel>> getProducts() async {
// //     String username = 'sigmentasi';
// //     String password = 'S!gm3nt4s12022!';
// //     String basicAuth =
// //         'Basic ' + base64.encode(utf8.encode('$username:$password'));
// //     print(basicAuth);

// //     var response = await http.get(
// //         Uri.parse("https://api.lenterailmu.id/product/product/list"),
// //         headers: <String, String>{'authorization': basicAuth});

// //     print(response.body);
// //     // var url = '$baseUrl/products/list';
// //     // String username = 'sigmentasi';
// //     // String password = 'S!gm3nt4s12022!';
// //     // String basicAuth =
// //     //     'Basic ' + base64.encode(utf8.encode('$username:$password'));
// //     // var url = "$baseUrl/products/list";
// //     // var response = await http.get(Uri.parse(baseUrl),
// //     //     headers: <String, String>{'authorization': basicAuth});

// //     // // ignore: avoid_print
// //     // print(response.body);

// //     if (response.statusCode == 200) {
// //       List data = jsonDecode(response.body)['data']['items'];
// //       // List<ProductModel> products = [];

// //       List<ProductModel> products =
// //           data.map((item) => ProductModel.fromJson(item)).toList();

// //       return products;
// //     } else {
// //       throw Exception('Gagal Get Product!');
// //     }
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:lentera_ilmu/models/product_model.dart';
// import 'package:lentera_ilmu/services/product.dart';
// // import 'package:lentera_ilmu/models/lms/product_model.dart';
// // import 'package:lentera_ilmu/models/product_model.dart';
// // import 'package:lentera_ilmu/services/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<ProductModel> _products = [];

//   List<ProductModel> get products => _products;

//   set products(List<ProductModel> products) {
//     _products = products;
//     notifyListeners();
//   }

//   Future<void> getProducts() async {
//     try {
//       // ignore: unused_local_variable
//       List<ProductModel> products = await ProductService().getProducts();
//       _products = products;
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }
//   }
// }
