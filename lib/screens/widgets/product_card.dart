// import 'package:flutter/material.dart';
// import 'package:lentera_ilmu/models/lms/product_model.dart';
// import 'package:lentera_ilmu/models/product_model.dart';
// import 'package:lentera_ilmu/screens/produk/produk.dart';
// // import 'package:shamo/models/product_model.dart';
// // import 'package:shamo/pages/product_page.dart';
// import 'package:lentera_ilmu/theme.dart';

// class ProductCard extends StatelessWidget {
//   final ProductModel product;
//   ProductCard(this.product);
//   // final ProductModel product;
//   // ProductCard(this.product);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProdukScreen(),
//           ),
//         );
//       },
//       child: Container(
//         width: 215,
//         height: 278,
//         margin: EdgeInsets.only(
//           right: defaultMargin,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Color(0xffECEDEF),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Image.network(
//                 '${product.photo}',
//                 // "assets/img/Morgan.png",
//                 // product.thumbnail!,
//                 width: 90,
//                 height: 128,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 19,
//                   ),
//                   Text(
//                     '${product.creatorName}',
//                     // 'Buku',
//                     // product.category_name!,
//                     style: secondaryTextStyle.copyWith(
//                       fontSize: 12,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     '${product.name}',
//                     // 'SELF IMPROVEMENT',
//                     // product.name!,
//                     style: blackTextStyle.copyWith(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     '${product.variants[0].price}',
//                     // 'Rp.100.000,-',
//                     // '\$${product.variants}',
//                     style: priceprodukTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // // ignore_for_file: use_key_in_widget_constructors, must_be_immutable

// // import 'package:flutter/material.dart';
// // import 'package:lentera_ilmu/models/product_model.dart';
// // // import 'package:lentera_ilmu/controllers/product.dart';
// // // import 'package:lentera_ilmu/models/lms/product_model.dart';
// // // import 'package:lentera_ilmu/models/lms/product_list.dart';
// // import 'package:lentera_ilmu/theme.dart';

// // class ProductCard extends StatelessWidget {
// //   final ProductModel product;
// //   ProductCard(this.product);
// //   // ProductModel item;
// //   // ProductCard({required this.item});
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.pushNamed(context, '/product');
// //       },
// //       child: Container(
// //         height: 278,
// //         width: 215,
// //         margin: EdgeInsets.only(
// //           right: defaultMargin,
// //         ),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(20),
// //           color: const Color(0XFFECEDEF),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(
// //               height: 30,
// //             ),
// //             Center(
// //               child: Image.network(
// //                 product.galleries![0].url!,
// //                 width: 90,
// //                 height: 128,
// //               ),
// //             ),
// //             Container(
// //               margin: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const SizedBox(
// //                     height: 19,
// //                   ),
// //                   Text(
// //                     'Buku',
// //                     style: secondaryTextStyle.copyWith(
// //                       fontSize: 12,
// //                     ),
// //                   ),
// //                   const SizedBox(
// //                     height: 6,
// //                   ),
// //                   Text(
// //                     'SELF IMPROVEMENT',
// //                     style: blackTextStyle.copyWith(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                   const SizedBox(
// //                     height: 6,
// //                   ),
// //                   Text(
// //                     'Rp. 75.000',
// //                     style: priceprodukTextStyle.copyWith(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //         // height: 225,
// //         // width: 400,
// //         // decoration: BoxDecoration(
// //         //   color: const Color(0xFFFFFFFF),
// //         //   borderRadius: const BorderRadius.all(Radius.circular(8)),
// //         //   boxShadow: <BoxShadow>[
// //         //     BoxShadow(
// //         //       color: Colors.grey.shade300,
// //         //       blurRadius: 5.0,
// //         //       offset: const Offset(4, 5),
// //         //     ),
// //         //   ],
// //         // ),
// //         // child: ListView(
// //         //   physics: const BouncingScrollPhysics(),
// //         //   scrollDirection: Axis.horizontal,
// //         //   padding: const EdgeInsets.only(
// //         //     left: 5,
// //         //     right: 6,
// //         //     bottom: 3,
// //         //   ),
// //         //   children: [
// //         //     Container(
// //         //       height: 225,
// //         //       width: 208,
// //         //       decoration: BoxDecoration(
// //         //         color: const Color(0xFFF3F3F3),
// //         //         borderRadius: const BorderRadius.all(Radius.circular(8)),
// //         //         boxShadow: <BoxShadow>[
// //         //           BoxShadow(
// //         //             color: Colors.grey.shade300,
// //         //             blurRadius: 5.0,
// //         //             offset: const Offset(4, 5),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //       child: Column(
// //         //         children: [
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(top: 15),
// //         //             child: Image.asset(
// //         //               "assets/img/Risoles.png",
// //         //               width: 180,
// //         //               height: 108,
// //         //               fit: BoxFit.cover,
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 15,
// //         //           ),
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(right: 50),
// //         //             child: Container(
// //         //               width: 130,
// //         //               height: 20,
// //         //               decoration: const BoxDecoration(
// //         //                 color: Color(0XFFD594A8),
// //         //                 borderRadius: BorderRadius.all(Radius.circular(30)),
// //         //               ),
// //         //               child: Column(
// //         //                 children: [
// //         //                   Row(
// //         //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //                     children: const [
// //         //                       Padding(
// //         //                         padding: EdgeInsets.only(left: 5),
// //         //                         child: Text(
// //         //                           "Food and Beverage",
// //         //                           style: TextStyle(
// //         //                             fontSize: 14,
// //         //                             color: Colors.white,
// //         //                             fontWeight: FontWeight.w600,
// //         //                           ),
// //         //                         ),
// //         //                       ),
// //         //                     ],
// //         //                   ),
// //         //                 ],
// //         //               ),
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 10,
// //         //           ),
// //         //           Row(
// //         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //             children: const [
// //         //               Padding(
// //         //                 padding: EdgeInsets.only(left: 12),
// //         //                 child: Text(
// //         //                   "Risol Mayo Bang Deny",
// //         //                   style: TextStyle(
// //         //                       fontFamily: "Poppins",
// //         //                       fontSize: 16,
// //         //                       color: Colors.black54,
// //         //                       fontWeight: FontWeight.w700),
// //         //                 ),
// //         //               ),
// //         //               SizedBox(
// //         //                 width: 3,
// //         //               ),
// //         //             ],
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 6,
// //         //           ),
// //         //           const Padding(
// //         //             padding: EdgeInsets.only(right: 34),
// //         //             child: Text(
// //         //               "PT Indonesian Kuliner",
// //         //               style: TextStyle(
// //         //                   fontFamily: "Poppins",
// //         //                   fontSize: 14,
// //         //                   color: Color(0x70252424),
// //         //                   fontWeight: FontWeight.w600),
// //         //             ),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //     ),
// //         //     const SizedBox(
// //         //       width: 20,
// //         //     ),
// //         //     Container(
// //         //       height: 218,
// //         //       width: 208,
// //         //       decoration: BoxDecoration(
// //         //         color: const Color(0XFFF3F3F3),
// //         //         borderRadius: const BorderRadius.all(Radius.circular(8)),
// //         //         boxShadow: <BoxShadow>[
// //         //           BoxShadow(
// //         //             color: Colors.grey.shade300,
// //         //             blurRadius: 5.0,
// //         //             offset: const Offset(4, 5),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //       child: Column(
// //         //         children: [
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(top: 15),
// //         //             child: Image.asset(
// //         //               "assets/img/Dessert.png",
// //         //               width: 180,
// //         //               height: 108,
// //         //               fit: BoxFit.cover,
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 15,
// //         //           ),
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(right: 50),
// //         //             child: Container(
// //         //               width: 130,
// //         //               height: 20,
// //         //               decoration: const BoxDecoration(
// //         //                 color: Color(0XFFD594A8),
// //         //                 borderRadius: BorderRadius.all(Radius.circular(30)),
// //         //               ),
// //         //               child: Column(
// //         //                 children: [
// //         //                   Row(
// //         //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //                     children: const [
// //         //                       Padding(
// //         //                         padding: EdgeInsets.only(left: 5),
// //         //                         child: Text(
// //         //                           "Food and Beverage",
// //         //                           style: TextStyle(
// //         //                             fontSize: 14,
// //         //                             color: Colors.white,
// //         //                             fontWeight: FontWeight.w600,
// //         //                           ),
// //         //                         ),
// //         //                       ),
// //         //                     ],
// //         //                   ),
// //         //                 ],
// //         //               ),
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 10,
// //         //           ),
// //         //           Row(
// //         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //             children: const [
// //         //               Padding(
// //         //                 padding: EdgeInsets.only(left: 12),
// //         //                 child: Text(
// //         //                   "Dessert By Najla",
// //         //                   style: TextStyle(
// //         //                       fontFamily: "Poppins",
// //         //                       fontSize: 16,
// //         //                       color: Colors.black54,
// //         //                       fontWeight: FontWeight.w700),
// //         //                 ),
// //         //               ),
// //         //               SizedBox(
// //         //                 width: 3,
// //         //               ),
// //         //             ],
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 6,
// //         //           ),
// //         //           const Padding(
// //         //             padding: EdgeInsets.only(right: 30),
// //         //             child: Text(
// //         //               "PT Kuliner Nusantaran",
// //         //               style: TextStyle(
// //         //                   fontFamily: "Poppins",
// //         //                   fontSize: 14,
// //         //                   color: Color.fromARGB(113, 37, 36, 36),
// //         //                   fontWeight: FontWeight.w600),
// //         //             ),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //     ),
// //         //     const SizedBox(
// //         //       width: 20,
// //         //     ),
// //         //     Container(
// //         //       height: 218,
// //         //       width: 208,
// //         //       decoration: BoxDecoration(
// //         //         color: const Color(0XFFF3F3F3),
// //         //         borderRadius: const BorderRadius.all(Radius.circular(8)),
// //         //         boxShadow: <BoxShadow>[
// //         //           BoxShadow(
// //         //             color: Colors.grey.shade300,
// //         //             blurRadius: 5.0,
// //         //             offset: const Offset(4, 5),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //       child: Column(
// //         //         children: [
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(top: 15),
// //         //             child: Image.asset(
// //         //               "assets/img/Kas_solo.png",
// //         //               width: 180,
// //         //               height: 108,
// //         //               fit: BoxFit.cover,
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 15,
// //         //           ),
// //         //           Padding(
// //         //             padding: const EdgeInsets.only(right: 50),
// //         //             child: Container(
// //         //               width: 130,
// //         //               height: 20,
// //         //               decoration: const BoxDecoration(
// //         //                 color: Color(0XFFD594A8),
// //         //                 borderRadius: BorderRadius.all(Radius.circular(30)),
// //         //               ),
// //         //               child: Column(
// //         //                 children: [
// //         //                   Row(
// //         //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //                     children: const [
// //         //                       Padding(
// //         //                         padding: EdgeInsets.only(left: 5),
// //         //                         child: Text(
// //         //                           "Food and Beverage",
// //         //                           style: TextStyle(
// //         //                             fontSize: 14,
// //         //                             color: Colors.white,
// //         //                             fontWeight: FontWeight.w600,
// //         //                           ),
// //         //                         ),
// //         //                       ),
// //         //                     ],
// //         //                   ),
// //         //                 ],
// //         //               ),
// //         //             ),
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 10,
// //         //           ),
// //         //           Row(
// //         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //             children: const [
// //         //               Padding(
// //         //                 padding: EdgeInsets.only(left: 12),
// //         //                 child: Text(
// //         //                   "Dapur Solo Mbo",
// //         //                   style: TextStyle(
// //         //                       fontFamily: "Poppins",
// //         //                       fontSize: 16,
// //         //                       color: Colors.black54,
// //         //                       fontWeight: FontWeight.w700),
// //         //                 ),
// //         //               ),
// //         //               SizedBox(
// //         //                 width: 3,
// //         //               ),
// //         //             ],
// //         //           ),
// //         //           const SizedBox(
// //         //             height: 6,
// //         //           ),
// //         //           const Padding(
// //         //             padding: EdgeInsets.only(right: 63),
// //         //             child: Text(
// //         //               "PT Boga Bersama",
// //         //               style: TextStyle(
// //         //                   fontFamily: "Poppins",
// //         //                   fontSize: 14,
// //         //                   color: Color.fromARGB(113, 37, 36, 36),
// //         //                   fontWeight: FontWeight.w600),
// //         //             ),
// //         //           ),
// //         //         ],
// //         //       ),
// //         //     ),
// //         //   ],
// //         // ),
// //       ),
// //     );
// //   }
// // }
