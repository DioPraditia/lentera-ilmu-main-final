import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_ilmu/controllers/product.dart';
import 'package:lentera_ilmu/models/product/product.dart';
import 'package:lentera_ilmu/models/product_model.dart';
import 'package:lentera_ilmu/screens/produk/produk.dart';
import 'package:http/http.dart' as http;

class ScreenProduk extends StatefulWidget {
  const ScreenProduk({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenProduk> createState() => _ScreenProdukState();
}

class _ScreenProdukState extends State<ScreenProduk> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final productController = Get.put(ProductController());

  final List<Widget> myData = [
    Container(
      margin: const EdgeInsets.all(8),
      width: 382,
      height: 167,
      decoration: const BoxDecoration(
        color: Color(0xFFF05656),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Solusi tepat\nbelajar\nmengatur\nkeuangan",
              style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0XFFE9EEF4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Container(
              width: 146,
              height: 173,
              decoration: BoxDecoration(
                color: const Color(0XFFF8E6CB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/Morgan.png",
                    width: 143,
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.all(8),
      width: 382,
      height: 167,
      decoration: const BoxDecoration(
        color: Color(0xFFF05656),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Selalu ada\npromo,\nmenarik!",
              style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0XFFE9EEF4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Container(
              width: 148,
              height: 173,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 92, 92, 90),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/Toolkin.png",
                    width: 143,
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.all(8),
      width: 382,
      height: 167,
      decoration: const BoxDecoration(
        color: Color(0xFFF05656),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Bawa Pulang\nbukunya dan\ndapatkan diskon\nspesial!",
              style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0XFFE9EEF4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Container(
              width: 116,
              height: 173,
              decoration: BoxDecoration(
                color: const Color(0XFFF8D49B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/book.png",
                    width: 115,
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.all(8),
      width: 382,
      height: 167,
      decoration: const BoxDecoration(
        color: Color(0xFFF05656),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Membangun\nkebiasaan\nbaik dari hal,\nterkecil",
              style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0XFFE9EEF4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(
              width: 144,
              height: 173,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 183, 136),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/Automic.png",
                    width: 143,
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    productController.getProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          "Produk",
          maxFontSize: 16,
        ),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 187,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: CarouselSlider(
                        items: myData,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: myData.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : const Color(0XFFE984A2))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: FutureBuilder<List<ProductModel>>(
                    future: fetchProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductModel> products =
                            snapshot.data as List<ProductModel>;
                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 215,
                              height: 278,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F3),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                // boxShadow: <BoxShadow>[
                                //   BoxShadow(
                                //     color: Colors.grey.shade300,
                                //     blurRadius: 5.0,
                                //     offset: const Offset(4, 5),
                                //   ),
                                // ],
                              ),
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () => Get.to(
                                  () => ProductDetailScreen(
                                      productData:
                                          productController.products[index]),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    for (var variant
                                        in products[index].variants) ...[
                                      // Text(
                                      //   'No.${index + 1} Product Example',
                                      //   style: const TextStyle(
                                      //       fontWeight:
                                      //           FontWeight
                                      //               .bold),
                                      // ),
                                      // Text(
                                      //     '${products[index].name}'),
                                      // Text(
                                      //     'description: ${products[index].description}'),
                                      // Text(
                                      //     'category: ${products[index].categoryName}'),
                                      // Text(
                                      //     'youtube url: ${products[index].video}'),
                                      Center(
                                        child: Container(
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: Image.network(
                                              products[index].thumbnail!,
                                              width: 180,
                                              height: 108,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      //display franshise example
                                      // const Text(
                                      //   "Franshise Product Example",
                                      //   style: TextStyle(
                                      //       fontWeight:
                                      //           FontWeight
                                      //               .bold),
                                      // ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Container(
                                          width: 130,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            color: Color(0XFFD594A8),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              '${products[index].category_name}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 13,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          '${products[index].name}',
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          '${products[index].creator_name}',
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              color: Color(0x70252424),
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Rp.${variant.price},-",
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ),

                                      // Text(
                                      //     "price : ${products[index].variants[index].price}"),

                                      // Text(
                                      //     'creator: ${products[index].franchise!.creator_name}'),
                                      // Text(
                                      //     'detail: ${products[index].franchise!.detail}'),

                                      // display variant product example
                                      // const Text(
                                      //   "Variant Product Example",
                                      //   style: TextStyle(
                                      //       fontWeight:
                                      //           FontWeight
                                      //               .bold),
                                      // ),

                                      // for (var variant
                                      //     in products[index]
                                      //         .variants) ...[
                                      // Image.network(
                                      //     variant.photo),
                                      // Text(
                                      //     "name : ${variant.name}"),
                                      // Text(
                                      //     "description : ${variant.description}"),
                                      // Text(
                                      //     "price : ${variant.price}"),
                                      // Text(
                                      //     "suplay product : ${variant.supply}"),
                                      // ]
                                    ]
                                  ],
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.75),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return const Text('error');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                )
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () => Get.to(
                //           () => const ProdukScreen(),
                //         ),
                //         child: Container(
                //           height: 235,
                //           width: 197,
                //           decoration: const BoxDecoration(
                //             color: Color(0XFFF3F3F3),
                //             borderRadius: BorderRadius.all(Radius.circular(8)),
                //             // boxShadow: <BoxShadow>[
                //             //   BoxShadow(
                //             //     color: Colors.black26,
                //             //     blurRadius: 5.0,
                //             //     offset: Offset(1, 2),
                //             //   ),
                //             // ],
                //           ),
                //           child: Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 15),
                //                 child: Image.asset(
                //                   "assets/img/Automic.png",
                //                   width: 80,
                //                   height: 108,
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 25,
                //               ),
                //               Column(
                //                 children: const [
                //                   Padding(
                //                     padding: EdgeInsets.only(right: 5),
                //                     child: Text(
                //                       "Buku Self Improvement\nAutomic Habbits",
                //                       style: TextStyle(
                //                         fontSize: 16,
                //                         color: Colors.black54,
                //                         fontWeight: FontWeight.w700,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               const SizedBox(
                //                 height: 17,
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(right: 92),
                //                 child: Text(
                //                   "Rp. 100.000",
                //                   style: TextStyle(
                //                       fontFamily: "Poppins",
                //                       fontSize: 14,
                //                       color: Colors.teal,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 40,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Container(
                //               height: 235,
                //               width: 197,
                //               decoration: const BoxDecoration(
                //                 color: Color(0XFFF3F3F3),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(8)),
                //                 // boxShadow: <BoxShadow>[
                //                 //   BoxShadow(
                //                 //     color: Colors.black26,
                //                 //     blurRadius: 5.0,
                //                 //     offset: Offset(1, 2),
                //                 //   ),
                //                 // ],
                //               ),
                //               child: Column(
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 15),
                //                     child: Image.asset(
                //                       "assets/img/Morgan.png",
                //                       width: 80,
                //                       height: 108,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 25,
                //                   ),
                //                   Column(
                //                     children: const [
                //                       Padding(
                //                         padding: EdgeInsets.only(right: 5),
                //                         child: Text(
                //                           "Buku Self Improvement Psychology Money",
                //                           style: TextStyle(
                //                             fontSize: 16,
                //                             color: Colors.black54,
                //                             fontWeight: FontWeight.w700,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   const SizedBox(
                //                     height: 17,
                //                   ),
                //                   const Padding(
                //                     padding: EdgeInsets.only(right: 92),
                //                     child: Text(
                //                       "Rp. 87.000",
                //                       style: TextStyle(
                //                           fontFamily: "Poppins",
                //                           fontSize: 14,
                //                           color: Colors.teal,
                //                           fontWeight: FontWeight.w600),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //         height: 235,
                //         width: 197,
                //         decoration: const BoxDecoration(
                //           color: Color(0XFFF3F3F3),
                //           borderRadius: BorderRadius.all(Radius.circular(8)),
                //           // boxShadow: <BoxShadow>[
                //           //   BoxShadow(
                //           //     color: Colors.black26,
                //           //     blurRadius: 5.0,
                //           //     offset: Offset(1, 2),
                //           //   ),
                //           // ],
                //         ),
                //         child: Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(top: 15),
                //               child: Image.asset(
                //                 "assets/img/Filosofi-Teras.png",
                //                 width: 80,
                //                 height: 108,
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 25,
                //             ),
                //             Column(
                //               children: const [
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 5),
                //                   child: Text(
                //                     "Buku Self Improvement\nFilsafat Yunani Kuno",
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                       color: Colors.black54,
                //                       fontWeight: FontWeight.w700,
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             const SizedBox(
                //               height: 17,
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.only(right: 92),
                //               child: Text(
                //                 "Rp. 110.000",
                //                 style: TextStyle(
                //                     fontFamily: "Poppins",
                //                     fontSize: 14,
                //                     color: Colors.teal,
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 25,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 12),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Container(
                //               height: 235,
                //               width: 197,
                //               decoration: const BoxDecoration(
                //                 color: Color(0XFFF3F3F3),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(8)),
                //                 // boxShadow: <BoxShadow>[
                //                 //   BoxShadow(
                //                 //     color: Colors.black26,
                //                 //     blurRadius: 5.0,
                //                 //     offset: Offset(1, 2),
                //                 //   ),
                //                 // ],
                //               ),
                //               child: Column(
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 15),
                //                     child: Image.asset(
                //                       "assets/img/Buku-Investor.png",
                //                       width: 80,
                //                       height: 108,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 25,
                //                   ),
                //                   Column(
                //                     children: const [
                //                       Padding(
                //                         padding: EdgeInsets.only(right: 5),
                //                         child: Text(
                //                           "Warrent & Lo Kheng\nUntuk Investor Pemula",
                //                           style: TextStyle(
                //                             fontSize: 16,
                //                             color: Colors.black54,
                //                             fontWeight: FontWeight.w700,
                //                           ),
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 17,
                //                       ),
                //                       Padding(
                //                         padding: EdgeInsets.only(right: 92),
                //                         child: Text(
                //                           "Rp. 65.000",
                //                           style: TextStyle(
                //                               fontFamily: "Poppins",
                //                               fontSize: 14,
                //                               color: Colors.teal,
                //                               fontWeight: FontWeight.w600),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ProductModel>> fetchProducts() async {
    var basicAuth =
        'Basic ${base64Encode(utf8.encode("sigmentasi" ":" "S!gm3nt4s12022!"))}';

    final response = await http.get(
      Uri.parse('https://api.lenterailmu.id/product/user/product/list'),
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
      },
    );

    return (json.decode(response.body)['data']["items"] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
