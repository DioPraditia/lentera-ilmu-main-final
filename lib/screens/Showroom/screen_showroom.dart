import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:auto_size_text/auto_size_text.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lentera_ilmu/controllers/lms.dart';
import 'package:lentera_ilmu/controllers/media.dart';
import 'package:lentera_ilmu/controllers/showroom.dart';
import 'package:lentera_ilmu/models/showroom/showroom.dart';
import 'package:lentera_ilmu/screens/Showroom/Detailscreen.dart';
import 'package:lentera_ilmu/screens/media/article_screen.dart';
import 'package:http/http.dart' as http;

class ScreenShowroom extends StatefulWidget {
  const ScreenShowroom({Key? key}) : super(key: key);

  @override
  State<ScreenShowroom> createState() => _ScreenShowroomState();
}

class _ScreenShowroomState extends State<ScreenShowroom> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final mediaController = Get.put(MediaController());
  final lmsController = Get.put(LMSController());
  final showroomController = Get.put(ShowroomController());

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    lmsController.getHomeData();
    mediaController.onInit();
  }

  // final List<Widget> myData = [
  //   Container(
  //     margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
  //     child: ClipRRect(
  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         child: Stack(
  //           children: <Widget>[
  //             Image.asset(
  //               "assets/img/Iklan.png",
  //               fit: BoxFit.cover,
  //               width: 1000.0,
  //             ),
  //             Positioned(
  //               bottom: 0.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Color(0xffF0B666),
  //                       Color(0xFFF05656),
  //                     ],
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                   ),
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                   vertical: 10.0,
  //                   horizontal: 20.0,
  //                 ),
  //                 child: const AutoSizeText(
  //                   "100% Keuntungan Milik Mitra",
  //                   style: TextStyle(
  //                     color: Color(0xFFFFFFFF),
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                   maxFontSize: 16,
  //                   minFontSize: 14,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )),
  //   ),
  //   Container(
  //     margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
  //     child: ClipRRect(
  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         child: Stack(
  //           children: <Widget>[
  //             Image.asset(
  //               "assets/img/Iklan2.png",
  //               fit: BoxFit.cover,
  //               width: 1000.0,
  //             ),
  //             Positioned(
  //               bottom: 0.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Color(0xFFF05656),
  //                       Color(0xff997693),
  //                     ],
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                   ),
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                   vertical: 10.0,
  //                   horizontal: 20.0,
  //                 ),
  //                 child: const AutoSizeText(
  //                   "Nikmati Keuntungannya Bersama - sama",
  //                   style: TextStyle(
  //                     color: Color(0xFFFFFFFF),
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                   maxFontSize: 16,
  //                   minFontSize: 14,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )),
  //   ),
  //   Container(
  //     margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
  //     child: ClipRRect(
  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         child: Stack(
  //           children: <Widget>[
  //             Image.asset(
  //               "assets/img/promo menarik.png",
  //               fit: BoxFit.cover,
  //               width: 1000.0,
  //             ),
  //             Positioned(
  //               bottom: 0.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Colors.teal,
  //                       Color.fromARGB(200, 0, 0, 0),
  //                     ],
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                   ),
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                   vertical: 10.0,
  //                   horizontal: 20.0,
  //                 ),
  //                 child: const AutoSizeText(
  //                   "Promo Menarik Dari Berbagai Jenis Waralaba Hanya Ada Di Lentera Ilmu",
  //                   style: TextStyle(
  //                     color: Color(0xFFFFFFFF),
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                   maxFontSize: 16,
  //                   minFontSize: 14,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )),
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    // Upgrader.clearSavedSettings();
    mediaController.onInit();
    lmsController.onInit();
    lmsController.getHomeData();
    showroomController.getShowrooms();
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
          "Showroom Frenchise",
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
                    CarouselSlider(
                      items: mediaController.articles
                          .map(
                            (item) => GestureDetector(
                              onTap: () => {
                                Get.to(
                                  () => ArticleScreen(
                                    article: item,
                                  ),
                                ),
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(item.thumbnail,
                                            fit: BoxFit.cover, width: 1000.0),
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(200, 0, 0, 0),
                                                  Color.fromARGB(0, 0, 0, 0)
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 20.0,
                                            ),
                                            child: AutoSizeText(
                                              item.title,
                                              style: const TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxFontSize: 16,
                                              minFontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          )
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 5),
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _current = index;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: FutureBuilder<List<ShowroomModel>>(
                    future: fetchShowrooms(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ShowroomModel> showrooms =
                            snapshot.data as List<ShowroomModel>;
                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: showroomController.showrooms.length,
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
                                  () => ShowroomDetailScreen(
                                    showroomData:
                                        showroomController.showrooms[index],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    for (var variant in showroomController
                                        .showrooms[index].variants) ...[
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
                                              showroomController
                                                  .showrooms[index].thumbnail!,
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
                                              '${showroomController.showrooms[index].category_name}',
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
                                          '${showroomController.showrooms[index].name}',
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
                                          '${showroomController.showrooms[index].creator_name}',
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
                //           () => const ShowroomDetailScreen(),
                //         ),
                //         child: Column(
                //           children: [
                //             Container(
                //               height: 278,
                //               width: 215,
                //               decoration: const BoxDecoration(
                //                 color: Color(0XFFF3F3F3),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //               ),
                //               margin: const EdgeInsets.all(8),
                //               padding: const EdgeInsets.all(8),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const SizedBox(
                //                     height: 10,
                //                   ),
                //                   Center(
                //                     child: Container(
                //                       child: ClipRRect(
                //                         borderRadius: const BorderRadius.all(
                //                             Radius.circular(10)),
                //                         child: Image.asset(
                //                           "assets/img/Risoles.png",
                //                           width: 180,
                //                           height: 108,
                //                           fit: BoxFit.cover,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 20,
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                       left: 10,
                //                     ),
                //                     child: Container(
                //                       width: 140,
                //                       height: 20,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0XFFD594A8),
                //                         borderRadius: BorderRadius.all(
                //                             Radius.circular(30)),
                //                       ),
                //                       child: Column(
                //                         children: [
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: const [
                //                               Padding(
                //                                 padding:
                //                                     EdgeInsets.only(left: 5),
                //                                 child: Text(
                //                                   "Food and Beverage",
                //                                   style: TextStyle(
                //                                     fontSize: 14,
                //                                     color: Colors.white,
                //                                     fontWeight: FontWeight.w600,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 13,
                //                   ),
                //                   const Padding(
                //                     padding: const EdgeInsets.only(left: 10),
                //                     child: Text(
                //                       "Risol Mayo Bang Deny",
                //                       style: TextStyle(
                //                           fontFamily: "Poppins",
                //                           fontSize: 16,
                //                           color: Colors.black54,
                //                           fontWeight: FontWeight.w700),
                //                       overflow: TextOverflow.ellipsis,
                //                       maxLines: 1,
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 6,
                //                   ),
                //                   const Padding(
                //                     padding: const EdgeInsets.only(left: 10),
                //                     child: Text(
                //                       "PT Indonesian Kuliner",
                //                       style: TextStyle(
                //                           fontFamily: "Poppins",
                //                           fontSize: 14,
                //                           color:
                //                               Color.fromARGB(113, 37, 36, 36),
                //                           fontWeight: FontWeight.w600),
                //                       overflow: TextOverflow.ellipsis,
                //                       maxLines: 1,
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 15,
                //                   ),
                //                   const Padding(
                //                     padding: const EdgeInsets.only(left: 10),
                //                     child: Text(
                //                       "Rp.30.000,-",
                //                       style: TextStyle(
                //                         fontFamily: "Poppins",
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w600,
                //                         color: Colors.teal,
                //                       ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ShowroomModel>> fetchShowrooms() async {
    var basicAuth =
        'Basic ${base64Encode(utf8.encode("sigmentasi" ":" "S!gm3nt4s12022!"))}';

    final response = await http.get(
      Uri.parse('https://api.lenterailmu.id/showroom/user/showroom/list'),
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
      },
    );

    return (json.decode(response.body)['data']["items"] as List)
        .map((e) => ShowroomModel.fromJson(e))
        .toList();
  }
}
