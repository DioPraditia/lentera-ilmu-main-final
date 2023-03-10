// ignore_for_file: unused_element, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lentera_ilmu/controllers/lms.dart';
import 'package:lentera_ilmu/controllers/media.dart';
import 'package:lentera_ilmu/controllers/order.dart';
import 'package:lentera_ilmu/controllers/product.dart';
import 'package:lentera_ilmu/controllers/profile.dart';
import 'package:lentera_ilmu/models/lms/course.dart';
// import 'package:lentera_ilmu/models/lms/product_list.dart';
import 'package:lentera_ilmu/models/lms/product_model.dart';
import 'package:lentera_ilmu/models/product/product.dart';
import 'package:lentera_ilmu/models/product_model.dart';
import 'package:lentera_ilmu/providers/product_providers.dart';
import 'package:lentera_ilmu/screens/Showroom/screen_showroom.dart';

import 'package:lentera_ilmu/screens/Showroom/Detailscreen.dart';
import 'package:lentera_ilmu/screens/Showroom/showroom_screen2.dart';
import 'package:lentera_ilmu/screens/bundling/bundling.dart';
import 'package:lentera_ilmu/screens/coming_soon_screen.dart';
import 'package:lentera_ilmu/screens/course/course_list_screen.dart';
import 'package:lentera_ilmu/screens/course/course_screen.dart';
import 'package:lentera_ilmu/screens/home/search_screen.dart';
import 'package:lentera_ilmu/screens/media/article_screen.dart';
import 'package:lentera_ilmu/screens/produk/produk.dart';
import 'package:lentera_ilmu/screens/produk/screen_produk.dart';
import 'package:lentera_ilmu/screens/profile/kyc/upload_document_kyc_screen.dart';
import 'package:lentera_ilmu/screens/profile/kyc/waiting_kyc_screen.dart';
import 'package:lentera_ilmu/screens/profile/mutation_screen.dart';
import 'package:lentera_ilmu/screens/profile/profile_screen.dart';
import 'package:lentera_ilmu/screens/profile/setting/email_verification_screen.dart';
import 'package:lentera_ilmu/screens/reward/reward_detil.dart';
import 'package:lentera_ilmu/screens/shimmer/home_shimmer.dart';
import 'package:lentera_ilmu/screens/subscription/subscription_list_screen.dart';
import 'package:lentera_ilmu/screens/subscription/subscription_screen.dart';
import 'package:lentera_ilmu/screens/transaction/cart/cart_screen.dart';
import 'package:lentera_ilmu/screens/widgets/list_course_item.dart';
import 'package:lentera_ilmu/screens/widgets/product_card.dart';
import 'package:lentera_ilmu/screens/withdraw/withdraw_screen.dart';
import 'package:lentera_ilmu/services/product.dart';
import 'package:lentera_ilmu/services/utils.dart';
import 'package:launch_review/launch_review.dart';
import 'package:lentera_ilmu/theme.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // final String url = 'http://10.0.2.2:6001/product/list';

  // Future<ProductModel> getProducts() async {
  //   String username = 'sigmentasi';
  //   String password = 'S!gm3nt4s12022!';
  //   String basicAuth =
  //       'Basic ' + base64.encode(utf8.encode('$username:$password'));
  // print(basicAuth);

  // Response r = await get(Uri.parse('https://api.somewhere.io'),
  //     headers: <String, String>{'authorization': basicAuth});
  // print(r.statusCode);
  // print(r.body);
  // var response = await http.get(Uri.parse(url),
  //     headers: <String, String>{'authorization': basicAuth});
  // print(json.decode(response.body));
  // if (response.statusCode == 200) {
  //   return ProductModel.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed');
  // }

  // return json.decode(response.body);
  // }

  // late Future<ProductModel>? productModel;
  ProductService productsService = ProductService();
  List<dynamic> products = [];
  final mediaController = Get.put(MediaController());
  final lmsController = Get.put(LMSController());
  final CarouselController _controller = CarouselController();
  final profileController = Get.put(ProfileController());
  final orderController = Get.put(OrderController());
  final productController = Get.put(ProductController());
  // final productController = Get.put(ProductsController());

  final formatCurrency = NumberFormat.decimalPattern();

  final List<Widget> myReward = [
    GestureDetector(
      onTap: () => Get.to(
        () => const RewardDetil(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/img/IconR.png',
                  width: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                const AutoSizeText(
                  "Reward",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  maxFontSize: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 93,
              ),
              child: AutoSizeText(
                "Cek detil",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
                maxFontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
    Column(
      children: [
        Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/img/direct.png',
                width: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const AutoSizeText(
              "Direct",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              maxFontSize: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 113),
          child: AutoSizeText(
            "3 / 6",
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
            maxFontSize: 13,
          ),
        ),

        // const Padding(
        //   padding: EdgeInsets.only(right: 93),
        //   child: AutoSizeText(
        //     "Cek detil",
        //     style: TextStyle(
        //       fontSize: 12,
        //       color: Colors.black54,
        //       fontWeight: FontWeight.w400,
        //     ),
        //     maxFontSize: 12,
        //   ),
        // ),
      ],
    ),
    Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/img/Indirect.png',
              width: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            const AutoSizeText(
              "Indirect",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              maxFontSize: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 100),
          child: AutoSizeText(
            "10 / 23",
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
            maxFontSize: 13,
          ),
        ),

        // const Padding(
        //   padding: EdgeInsets.only(right: 93),
        //   child: AutoSizeText(
        //     "Cek detil",
        //     style: TextStyle(
        //       fontSize: 12,
        //       color: Colors.black54,
        //       fontWeight: FontWeight.w400,
        //     ),
        //     maxFontSize: 12,
        //   ),
        // ),
      ],
    ),
  ];

  // ignore: unused_field
  int _current = 0;

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    lmsController.getHomeData();
    mediaController.onInit();
    profileController.fetchData(withLoading: false);
  }

  String getIcon(String evaType) {
    if (evaType == "withdraw") {
      return "assets/img/wd.png";
    }
    if (evaType == "ad") {
      return "assets/img/ad.png";
    }
    if (evaType == "other") {
      return "assets/img/other.png";
    }
    if (evaType == "hold") {
      return "assets/img/hold.png";
    }
    return "assets/img/wallet.png";
  }

  bool checkLock(CourseModel course, bool login) {
    bool lock = true;
    if (course.price_type == "free") {
      if (course.member == 1) {
        if (login == true) {
          lock = false;
        } else {
          lock = true;
        }
      } else {
        lock = false;
      }
    } else {
      lock = true;
    }
    return lock;
  }

  _launchURL() async {
    LaunchReview.launch(androidAppId: "id.app.lentera.ilmu");
  }

  final cfg = AppcastConfiguration(
      url: 'https://lenterailmu.id/appcast.xml', supportedOS: ['android']);

  @override
  void initState() {
    super.initState();
    // Upgrader.clearSavedSettings();
    mediaController.onInit();
    lmsController.onInit();
    lmsController.getHomeData();
    profileController.fetchData();
    profileController.getMedia();
    productController.getProducts();
    print("call");
    // getProducts();

    // getInit();
    // productModel = getProducts();
    // productController.getProducts();
    // print(productController);

    // getInit() async {
    //   await Provider.of<ProductProvider>(context, listen: false).getProducts();
    // }
  }

  // void getProducts() async {
  //   products = await productsService.getProducts();
  //   print(products);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var productProvider = Provider.of<ProductProvider>(context);
    // getProducts();
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.white,
                minimumSize: const Size(50, 16),
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
              onPressed: () => Get.to(
                () => const SearchScreen(),
                transition: Transition.rightToLeft,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left: 8),
                child: const Text(
                  "Cari Kursus...",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            //onPressed: () => Get.to(
            //  () => const SearchScreen(),
            //  transition: Transition.rightToLeft,
            //),
            //shape: RoundedRectangleBorder(
            //  borderRadius: BorderRadius.circular(6.0),
            //),
            //disabledTextColor: Colors.white,
            //textColor: Colors.white,
            //padding: const EdgeInsets.all(0),
            //child: Container(
            //alignment: Alignment.centerLeft,
            //height: 40.0,
            //width: MediaQuery.of(context).size.width,
            //decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(6.0),
            //color: Colors.white,
            //),
            //padding: const EdgeInsets.only(left: 8),
            //child: const Text(
            //"Cari Kursus...",
            //textAlign: TextAlign.left,
            //style: TextStyle(
            //fontWeight: FontWeight.normal,
            // color: Colors.grey,
            // ),
            // ),
            // ),
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.to(() => const CartScreen()),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const ProfileScreen()),
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 14),
                child: const Icon(
                  Icons.account_circle,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: UpgradeAlert(
          upgrader: Upgrader(
            platform: TargetPlatform.android,
            appcastConfig: cfg,
            showReleaseNotes: false,
            showIgnore: false,
            messages: UpgraderMessages(code: "id"),
            durationUntilAlertAgain: const Duration(minutes: 5),
            onUpdate: () {
              _launchURL();
              return true;
            },
          ),
          child: RefreshIndicator(
            color: Colors.teal,
            onRefresh: () => refreshData(),
            child: GetBuilder<LMSController>(builder: (lms) {
              return GetBuilder<MediaController>(builder: (media) {
                return GetBuilder<ProfileController>(builder: (profile) {
                  // return GetBuilder<ProductsController>(builder: (product) {
                  return profile.loading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        )
                      : ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(
                                      6,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      bottom: 3,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32)),
                                      // boxShadow: <BoxShadow>[
                                      //   BoxShadow(
                                      //       color: Colors.black26,
                                      //       blurRadius: 2.0,
                                      //       offset: Offset(0.0, 0.5))
                                      // ],
                                    ),
                                    child: Column(
                                      children: [
                                        profile.status?.eva != null
                                            ? Column(
                                                children: [
                                                  ListView(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 6,
                                                              bottom: 8,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 12,
                                                              bottom: 12,
                                                            ),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xFFD7F5EE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              8)),
                                                              // boxShadow: <BoxShadow>[
                                                              //   BoxShadow(
                                                              //     color: Colors
                                                              //         .grey.shade300,
                                                              //     blurRadius: 5.0,
                                                              //     offset: const Offset(
                                                              //         4, 5),
                                                              //   ),
                                                              // ],
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child:
                                                                      ListView(
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "assets/img/wallet.png",
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          const Padding(
                                                                              padding: EdgeInsets.only(right: 8)),
                                                                          const AutoSizeText(
                                                                            "Jumlah Points",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                            maxFontSize:
                                                                                14,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            7,
                                                                      ),
                                                                      AutoSizeText(
                                                                        formatCurrency
                                                                            .format(profile.accountBalance),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.teal,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                        maxFontSize:
                                                                            14,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      const AutoSizeText(
                                                                        "Swap & klik disini",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black54,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        maxFontSize:
                                                                            12,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap: () =>
                                                                                Get.to(
                                                                              () => MutationScreen(
                                                                                mutationType: profile.status?.eva[0].type ?? "",
                                                                                mutationTitle: profile.status?.eva[0].title ?? "",
                                                                              ),
                                                                              transition: Transition.rightToLeft,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Image.asset(
                                                                                  getIcon(profile.status?.eva[0].type ?? ""),
                                                                                  width: 20,
                                                                                ),
                                                                                const Padding(padding: EdgeInsets.all(4)),
                                                                                AutoSizeText(
                                                                                  profile.status?.eva[0].title ?? "",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: Colors.black54,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  maxFontSize: 14,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            7,
                                                                      ),
                                                                      AutoSizeText(
                                                                        formatCurrency.format(double.parse(profile.status?.eva[0].balance ??
                                                                            "")),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.teal,
                                                                        ),
                                                                        maxFontSize:
                                                                            13,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      const AutoSizeText(
                                                                        "Cek detil",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black54,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        maxFontSize:
                                                                            12,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap: () =>
                                                                                Get.to(
                                                                              () => MutationScreen(
                                                                                mutationType: profile.status?.eva[1].type ?? "",
                                                                                mutationTitle: profile.status?.eva[1].title ?? "",
                                                                              ),
                                                                              transition: Transition.rightToLeft,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Image.asset(
                                                                                  getIcon(profile.status?.eva[1].type ?? ""),
                                                                                  width: 20,
                                                                                ),
                                                                                const Padding(padding: EdgeInsets.all(4)),
                                                                                AutoSizeText(
                                                                                  profile.status?.eva[1].title ?? "",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: Colors.black54,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  maxFontSize: 14,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            7,
                                                                      ),
                                                                      AutoSizeText(
                                                                        formatCurrency.format(double.parse(profile.status?.eva[1].balance ??
                                                                            "")),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.teal,
                                                                        ),
                                                                        maxFontSize:
                                                                            13,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      const AutoSizeText(
                                                                        "Cek detil",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black54,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        maxFontSize:
                                                                            12,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap: () =>
                                                                                Get.to(
                                                                              () => MutationScreen(
                                                                                mutationType: profile.status?.eva[2].type ?? "",
                                                                                mutationTitle: profile.status?.eva[2].title ?? "",
                                                                              ),
                                                                              transition: Transition.rightToLeft,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Image.asset(
                                                                                  getIcon(profile.status?.eva[2].type ?? ""),
                                                                                  width: 20,
                                                                                ),
                                                                                const Padding(padding: EdgeInsets.all(4)),
                                                                                AutoSizeText(
                                                                                  profile.status?.eva[2].title ?? "",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: Colors.black54,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  maxFontSize: 14,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            7,
                                                                      ),
                                                                      AutoSizeText(
                                                                        formatCurrency.format(double.parse(profile.status?.eva[2].balance ??
                                                                            "")),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.teal,
                                                                        ),
                                                                        maxFontSize:
                                                                            13,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      const AutoSizeText(
                                                                        "Cek detil",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black54,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        maxFontSize:
                                                                            12,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap: () =>
                                                                                Get.to(
                                                                              () => MutationScreen(
                                                                                mutationType: profile.status?.eva[3].type ?? "",
                                                                                mutationTitle: profile.status?.eva[3].title ?? "",
                                                                              ),
                                                                              transition: Transition.rightToLeft,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Image.asset(
                                                                                  getIcon(profile.status?.eva[3].type ?? ""),
                                                                                  width: 20,
                                                                                ),
                                                                                const Padding(padding: EdgeInsets.all(4)),
                                                                                AutoSizeText(
                                                                                  profile.status?.eva[3].title ?? "",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: Colors.black54,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  maxFontSize: 14,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            7,
                                                                      ),
                                                                      AutoSizeText(
                                                                        formatCurrency
                                                                            .format(
                                                                          double.parse(profile.status?.eva[3].balance ??
                                                                              ""),
                                                                        ),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.teal,
                                                                        ),
                                                                        maxFontSize:
                                                                            13,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      const AutoSizeText(
                                                                        "Cek detil",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black54,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        maxFontSize:
                                                                            12,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            9,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(8),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 12,
                                                                    left: 10,
                                                                    right: 9,
                                                                  ),
                                                                  width: 160,
                                                                  height: 85,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          ListView(
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        children: [
                                                                          CarouselSlider(
                                                                            items:
                                                                                myReward,
                                                                            options:
                                                                                CarouselOptions(
                                                                              autoPlay: true,
                                                                              enlargeCenterPage: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              autoPlayInterval: const Duration(seconds: 4),
                                                                              aspectRatio: 2.0,
                                                                              onPageChanged: (index, reason) {
                                                                                setState(() {
                                                                                  _current = index;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      margin:
                                                                          const EdgeInsets.all(
                                                                              8),
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        top: 12,
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            9,
                                                                      ),
                                                                      width:
                                                                          160,
                                                                      height:
                                                                          85,
                                                                      decoration: const BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(8))),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  profile.status?.user
                                                              .subscription_until_date !=
                                                          null
                                                      ? Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          alignment:
                                                              Alignment.center,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              // ignore: deprecated_member_use
                                                              primary:
                                                                  Colors.white,
                                                              minimumSize:
                                                                  const Size(
                                                                      50, 16),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80.0),
                                                              ),
                                                            ),
                                                            onPressed: () => {
                                                              if (profile
                                                                      .status
                                                                      ?.user
                                                                      .email_verified ==
                                                                  0)
                                                                {
                                                                  Get.to(
                                                                    () =>
                                                                        const EmailVerificationScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                  )
                                                                },
                                                              if (profile
                                                                          .status
                                                                          ?.user
                                                                          .account_kyc ==
                                                                      "inexist" ||
                                                                  profile
                                                                          .status
                                                                          ?.user
                                                                          .account_kyc ==
                                                                      "rejected")
                                                                {
                                                                  Get.to(
                                                                    () =>
                                                                        const UploadDocumentKycScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                  )
                                                                },
                                                              if (profile
                                                                      .status
                                                                      ?.user
                                                                      .account_kyc ==
                                                                  "waiting")
                                                                {
                                                                  Get.to(
                                                                    () =>
                                                                        const WaitingKycScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                  )
                                                                },
                                                              if (profile
                                                                      .status
                                                                      ?.user
                                                                      .account_kyc ==
                                                                  "approved")
                                                                {
                                                                  Get.to(
                                                                    () =>
                                                                        const WithdrawScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                  )
                                                                }
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 45.0,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                                color:
                                                                    Colors.teal,
                                                              ),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              child: const Text(
                                                                "Withdraw",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                ],
                              ), // Ewallet
                              const SizedBox(
                                height: 10,
                              ),
                              lms.loading
                                  ? HomeCategoryShimmer()
                                  : SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.3,
                                      child: GridView.count(
                                        physics: const BouncingScrollPhysics(),
                                        crossAxisCount: 2,
                                        scrollDirection: Axis
                                            .horizontal, // to disable GridView's scrolling
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          for (var item in lms.categories)
                                            GestureDetector(
                                              onTap: () => Get.to(
                                                () => CourseListScreen(
                                                  category: item,
                                                ),
                                              ),
                                              child: Container(
                                                // width: 72,
                                                // width: ResponsiveFlutter.of(context).scale(120),
                                                // padding: const EdgeInsets.all(6),
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      item.icon!,
                                                      width: 52,
                                                    ),
                                                    // const Padding(padding: EdgeInsets.all(2)),
                                                    Text(
                                                      item.name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),

                              const SizedBox(
                                height: 10,
                              ),

                              lms.loading
                                  ? HomeNewsShimmer()
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CarouselSlider(
                                          items: mediaController.articles
                                              .map((item) => GestureDetector(
                                                    onTap: () => {
                                                      Get.to(
                                                        () => ArticleScreen(
                                                          article: item,
                                                        ),
                                                      ),
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8,
                                                              bottom: 8),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Image.network(
                                                                  item
                                                                      .thumbnail,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width:
                                                                      1000.0),
                                                              Positioned(
                                                                bottom: 0.0,
                                                                left: 0.0,
                                                                right: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color.fromARGB(
                                                                            200,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        Color.fromARGB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0)
                                                                      ],
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                    ),
                                                                  ),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        10.0,
                                                                    horizontal:
                                                                        20.0,
                                                                  ),
                                                                  child:
                                                                      AutoSizeText(
                                                                    item.title,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xFFFFFFFF),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    maxFontSize:
                                                                        16,
                                                                    minFontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  ))
                                              .toList(),
                                          carouselController: _controller,
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            aspectRatio: 3,
                                            viewportFraction: 1,
                                            autoPlayInterval:
                                                const Duration(seconds: 5),
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
                                height: 25,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AutoSizeText(
                                          "Paket Bundling",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxFontSize: 16,
                                          minFontSize: 14,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.to(
                                            () => const Bundling(),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: AutoSizeText(
                                              "Bundling Lainnya",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.teal,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxFontSize: 14,
                                              minFontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 290,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5.0,
                                          offset: const Offset(4, 5),
                                        ),
                                      ],
                                    ),
                                    child: ListView(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 380,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8)),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    blurRadius: 5.0,
                                                    offset: const Offset(4, 5),
                                                  ),
                                                ],
                                              ),
                                              child: ListView.builder(
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                // const NeverScrollableScrollPhysics(),
                                                itemCount: lms.courses.length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (_, index) =>
                                                    GestureDetector(
                                                  onTap: () => {
                                                    Get.to(
                                                      () => CourseScreen(
                                                        courseId: lms
                                                            .courses[index].id,
                                                        lock: checkLock(
                                                            lms.courses[index],
                                                            lms.isLogin),
                                                      ),
                                                    ),
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                      left: 7,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 230,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFFFFF)),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 100,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                                  child: Image
                                                                      .network(
                                                                    lms
                                                                        .courses[
                                                                            index]
                                                                        .thumbnail!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              AutoSizeText(
                                                                lms
                                                                    .courses[
                                                                        index]
                                                                    .creator_name,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .purple,
                                                                ),
                                                                maxFontSize: 12,
                                                                maxLines: 1,
                                                              ),
                                                              AutoSizeText(
                                                                lms
                                                                    .courses[
                                                                        index]
                                                                    .title,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                                maxFontSize: 15,
                                                                minFontSize: 12,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              AutoSizeText(
                                                                "Mulai dari ${formatCurrency.format(double.parse(lms.courses[index].price))}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .teal,
                                                                ),
                                                                maxFontSize: 13,
                                                                minFontSize: 11,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 17),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 150,
                                                            left: 5,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 47,
                                                                width: 110,
                                                                child:
                                                                    TextButton(
                                                                        style:
                                                                            ButtonStyle(
                                                                          padding:
                                                                              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(11)),
                                                                          foregroundColor:
                                                                              MaterialStateProperty.all<Color>(Colors.teal),
                                                                          shape:
                                                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                            RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              side: const BorderSide(width: 2.0, color: Colors.teal),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () =>
                                                                                {
                                                                                  orderController.addToBundlingBuy(lms.course, context),
                                                                                },
                                                                        child: const Text(
                                                                            "Beli Paket")),
                                                              )
                                                            ],
                                                          ),
                                                        ),

                                                        // const SizedBox(
                                                        //   width: 20,
                                                        // ),
                                                        // Container(
                                                        //   height: 230,
                                                        //   decoration:
                                                        //       const BoxDecoration(
                                                        //           color: Colors
                                                        //               .white),
                                                        //   child: Column(
                                                        //     children: [
                                                        //       Container(
                                                        //         height: 100,
                                                        //         decoration:
                                                        //             const BoxDecoration(
                                                        //           color: Colors
                                                        //               .white,
                                                        //         ),
                                                        //         child:
                                                        //             ClipRRect(
                                                        //           borderRadius: const BorderRadius
                                                        //                   .all(
                                                        //               Radius.circular(
                                                        //                   10)),
                                                        //           child: Image
                                                        //               .network(
                                                        //             lms
                                                        //                 .courses[
                                                        //                     index]
                                                        //                 .thumbnail!,
                                                        //             fit: BoxFit
                                                        //                 .cover,
                                                        //           ),
                                                        //         ),
                                                        //       ),
                                                        //       const SizedBox(
                                                        //         height: 15,
                                                        //       ),
                                                        //       AutoSizeText(
                                                        //         lms
                                                        //             .courses[
                                                        //                 index]
                                                        //             .title,
                                                        //         style:
                                                        //             const TextStyle(
                                                        //           fontSize: 16,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500,
                                                        //           color: Colors
                                                        //               .black87,
                                                        //         ),
                                                        //         maxFontSize: 15,
                                                        //         minFontSize: 12,
                                                        //         maxLines: 2,
                                                        //         overflow:
                                                        //             TextOverflow
                                                        //                 .ellipsis,
                                                        //       ),
                                                        //       AutoSizeText(
                                                        //         "Mulai dari ${formatCurrency.format(double.parse(lms.courses[index].price))}",
                                                        //         style:
                                                        //             const TextStyle(
                                                        //           fontSize: 14,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500,
                                                        //           color: Colors
                                                        //               .teal,
                                                        //         ),
                                                        //         maxFontSize: 13,
                                                        //         minFontSize: 11,
                                                        //       ),
                                                        //       const SizedBox(
                                                        //         height: 35,
                                                        //       ),
                                                        //       Expanded(
                                                        //         child: Column(
                                                        //           children: [
                                                        //             Container(
                                                        //               height:
                                                        //                   47,
                                                        //               width:
                                                        //                   110,
                                                        //               child: TextButton(
                                                        //                   style: ButtonStyle(
                                                        //                     padding:
                                                        //                         MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(11)),
                                                        //                     foregroundColor:
                                                        //                         MaterialStateProperty.all<Color>(Colors.teal),
                                                        //                     shape:
                                                        //                         MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        //                       RoundedRectangleBorder(
                                                        //                         borderRadius: BorderRadius.circular(8),
                                                        //                         side: const BorderSide(width: 2.0, color: Colors.teal),
                                                        //                       ),
                                                        //                     ),
                                                        //                   ),
                                                        //                   onPressed: () => {
                                                        //                         orderController.addToBundlingBuy(lms.course, context),
                                                        //                       },
                                                        //                   child: const Text("Beli Paket")),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       )
                                                        //     ],
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: 380,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 5.0,
                                                offset: const Offset(4, 5),
                                              ),
                                            ],
                                          ),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: lms.subscriptions.length,
                                            itemBuilder: (contex, index) =>
                                                GestureDetector(
                                              onTap: () => Get.to(
                                                () => SubscriptionScreen(
                                                  subscriptionId: lms
                                                      .subscriptions[index].id,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 33,
                                                  left: 7,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 230,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                              child:
                                                                  Image.network(
                                                                lms
                                                                    .subscriptions[
                                                                        index]
                                                                    .thumbnail!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          AutoSizeText(
                                                            lms
                                                                .subscriptions[
                                                                    index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                            maxFontSize: 15,
                                                            minFontSize: 12,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          AutoSizeText(
                                                            "Mulai dari ${formatCurrency.format(double.parse(lms.subscriptions[index].subscription_prices![0].selling_price))}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                            maxFontSize: 13,
                                                            minFontSize: 11,
                                                          ),
                                                          const SizedBox(
                                                            height: 17,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          24),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Row(
                                                                        children: const [
                                                                          AutoSizeText(
                                                                            "Rp.200.000",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontFamily: "Poppins",
                                                                              color: Colors.teal,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                            maxFontSize:
                                                                                16,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            7,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            33,
                                                                        height:
                                                                            21,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              220,
                                                                              220),
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(4),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            " 15%",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Poppins",
                                                                              color: Colors.red,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                            maxFontSize:
                                                                                13,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 7,
                                                                  ),
                                                                  const AutoSizeText(
                                                                    "Promo Akhir Tahun",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Popppins",
                                                                      color: Color(
                                                                          0x70252424),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      height: 230,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                              child:
                                                                  Image.network(
                                                                lms
                                                                    .subscriptions[
                                                                        index]
                                                                    .thumbnail!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          AutoSizeText(
                                                            lms
                                                                .subscriptions[
                                                                    index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                            maxFontSize: 15,
                                                            minFontSize: 12,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          AutoSizeText(
                                                            "Mulai dari ${formatCurrency.format(double.parse(lms.subscriptions[index].subscription_prices![0].selling_price))}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                            maxFontSize: 13,
                                                            minFontSize: 11,
                                                          ),
                                                          const SizedBox(
                                                            height: 35,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 47,
                                                                  width: 110,
                                                                  child:
                                                                      TextButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            padding:
                                                                                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(11)),
                                                                            foregroundColor:
                                                                                MaterialStateProperty.all<Color>(Colors.teal),
                                                                            shape:
                                                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                side: const BorderSide(width: 2.0, color: Colors.teal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            orderController.goToPaymentSubscription(
                                                                                lms.subscription.id,
                                                                                lms.subscription.name,
                                                                                lms.subscription.subscription_prices![index]);
                                                                          },
                                                                          child:
                                                                              const Text("Beli Paket")),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: 380,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 5.0,
                                                offset: const Offset(4, 5),
                                              ),
                                            ],
                                          ),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: lms.subscriptions.length,
                                            itemBuilder: (contex, index) =>
                                                GestureDetector(
                                              onTap: () => Get.to(
                                                () => SubscriptionScreen(
                                                  subscriptionId: lms
                                                      .subscriptions[index].id,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 33,
                                                  left: 7,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 230,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                              child:
                                                                  Image.network(
                                                                lms
                                                                    .subscriptions[
                                                                        index]
                                                                    .thumbnail!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          AutoSizeText(
                                                            lms
                                                                .subscriptions[
                                                                    index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                            maxFontSize: 15,
                                                            minFontSize: 12,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          AutoSizeText(
                                                            "Mulai dari ${formatCurrency.format(double.parse(lms.subscriptions[index].subscription_prices![0].selling_price))}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                            maxFontSize: 13,
                                                            minFontSize: 11,
                                                          ),
                                                          const SizedBox(
                                                            height: 17,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          24),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Row(
                                                                        children: const [
                                                                          AutoSizeText(
                                                                            "Rp.200.000",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontFamily: "Poppins",
                                                                              color: Colors.teal,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                            maxFontSize:
                                                                                16,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            7,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            33,
                                                                        height:
                                                                            21,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              220,
                                                                              220),
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(4),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            " 15%",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Poppins",
                                                                              color: Colors.red,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                            maxFontSize:
                                                                                13,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 7,
                                                                  ),
                                                                  const AutoSizeText(
                                                                    "Promo Akhir Tahun",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Popppins",
                                                                      color: Color(
                                                                          0x70252424),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      height: 230,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                              child:
                                                                  Image.network(
                                                                lms
                                                                    .subscriptions[
                                                                        index]
                                                                    .thumbnail!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          AutoSizeText(
                                                            lms
                                                                .subscriptions[
                                                                    index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                            maxFontSize: 15,
                                                            minFontSize: 12,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          AutoSizeText(
                                                            "Mulai dari ${formatCurrency.format(double.parse(lms.subscriptions[index].subscription_prices![0].selling_price))}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                            maxFontSize: 13,
                                                            minFontSize: 11,
                                                          ),
                                                          const SizedBox(
                                                            height: 35,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 47,
                                                                  width: 110,
                                                                  child:
                                                                      TextButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            padding:
                                                                                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(11)),
                                                                            foregroundColor:
                                                                                MaterialStateProperty.all<Color>(Colors.teal),
                                                                            shape:
                                                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                side: const BorderSide(width: 2.0, color: Colors.teal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            orderController.goToPaymentSubscription(
                                                                                lms.subscription.id,
                                                                                lms.subscription.name,
                                                                                lms.subscription.subscription_prices![index]);
                                                                          },
                                                                          child:
                                                                              const Text("Beli Paket")),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsets.only(
                                  //     top: 179,
                                  //   ),
                                  //   child: Expanded(
                                  //     child: Container(
                                  //       height: 47,
                                  //       width: 110,
                                  //       child: TextButton(
                                  //           style: ButtonStyle(
                                  //             padding: MaterialStateProperty.all<
                                  //                     EdgeInsets>(
                                  //                 const EdgeInsets
                                  //                     .all(11)),
                                  //             foregroundColor:
                                  //                 MaterialStateProperty
                                  //                     .all<Color>(
                                  //                         Colors
                                  //                             .teal),
                                  //             shape: MaterialStateProperty
                                  //                 .all<
                                  //                     RoundedRectangleBorder>(
                                  //               RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius
                                  //                         .circular(
                                  //                             8),
                                  //                 side: const BorderSide(
                                  //                     width: 2.0,
                                  //                     color: Colors
                                  //                         .teal),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           onPressed: () => {
                                  //                 orderController
                                  //                     .addToBundlingBuy(
                                  //                         lms.course,
                                  //                         context),
                                  //               },
                                  //           child: const Text(
                                  //               "Beli Paket")),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AutoSizeText(
                                          "Produk",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxFontSize: 16,
                                          minFontSize: 14,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.to(
                                            () => const ScreenProduk(),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: AutoSizeText(
                                              "Produk Lainnya",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.teal,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxFontSize: 14,
                                              minFontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 410,
                                        height: 290,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 5.0,
                                                offset: const Offset(4, 5),
                                              )
                                            ]),
                                        // child: ListView.builder(
                                        //   scrollDirection: Axis.horizontal,
                                        //   shrinkWrap: true,
                                        //   itemBuilder: (context, index) {
                                        //     return Container(
                                        //       width: 215,
                                        //       height: 278,
                                        //       decoration: BoxDecoration(
                                        //         color: const Color(0xFFF3F3F3),
                                        //         borderRadius:
                                        //             const BorderRadius.all(
                                        //                 Radius.circular(10)),
                                        //         boxShadow: <BoxShadow>[
                                        //           BoxShadow(
                                        //             color: Colors.grey.shade300,
                                        //             blurRadius: 5.0,
                                        //             offset: const Offset(4, 5),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       margin: const EdgeInsets.all(8),
                                        //       padding: const EdgeInsets.all(8),
                                        //       child: Card(
                                        //         child: Padding(
                                        //           padding: const EdgeInsets.all(
                                        //               15.0),
                                        //           child: Text(
                                        //               products[index]
                                        //                   .toString(),
                                        //               style: TextStyle(
                                        //                   fontSize: 30)),
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        //   itemCount: products.length,
                                        // )
                                        child:
                                            FutureBuilder<List<ProductModel>>(
                                          future: fetchProducts(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<ProductModel> products =
                                                  snapshot.data
                                                      as List<ProductModel>;
                                              return ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount: products.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () => Get.to(() =>
                                                          ProductDetailScreen(
                                                            productData:
                                                                productController
                                                                        .products[
                                                                    index],
                                                          )),
                                                      child: Container(
                                                        width: 215,
                                                        height: 278,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFFF3F3F3),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          boxShadow: <
                                                              BoxShadow>[
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              blurRadius: 5.0,
                                                              offset:
                                                                  const Offset(
                                                                      4, 5),
                                                            ),
                                                          ],
                                                        ),
                                                        margin: const EdgeInsets
                                                            .all(8),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            for (var variant
                                                                in products[
                                                                        index]
                                                                    .variants) ...[
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
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    child: Image
                                                                        .network(
                                                                      products[
                                                                              index]
                                                                          .thumbnail!,
                                                                      width:
                                                                          180,
                                                                      height:
                                                                          108,
                                                                      fit: BoxFit
                                                                          .cover,
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
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child:
                                                                    Container(
                                                                  width: 130,
                                                                  height: 20,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0XFFD594A8),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          30),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                    child: Text(
                                                                      '${products[index].category_name}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 13,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  '${products[index].name}',
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  '${products[index].creator_name}',
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0x70252424),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                ),
                                                              ),

                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  "Rp.${variant.price},-",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .teal,
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
                                                  });
                                            }
                                            if (snapshot.hasError) {
                                              print(snapshot.error.toString());
                                              return const Text('error');
                                            }
                                            return const CircularProgressIndicator();
                                          },
                                        )),
                                    // ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              lms.programLoading
                                  ? HomeSubscriptionShimmer()
                                  : Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 4, right: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const AutoSizeText(
                                                "Program",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxFontSize: 16,
                                                minFontSize: 14,
                                              ),
                                              GestureDetector(
                                                onTap: () => Get.to(
                                                  () =>
                                                      const SubscriptinListScreen(),
                                                ),
                                                child: const AutoSizeText(
                                                  "Program Lainnya",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxFontSize: 14,
                                                  minFontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(top: 14),
                                            child: ListView.builder(
                                              itemCount:
                                                  lms.subscriptions.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (contex, index) =>
                                                  GestureDetector(
                                                onTap: () => Get.to(
                                                  () => SubscriptionScreen(
                                                    subscriptionId: lms
                                                        .subscriptions[index]
                                                        .id,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      bottom: 8,
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .5,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(lms
                                                            .subscriptions[
                                                                index]
                                                            .thumbnail!),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  8)),
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            blurRadius: 2.0,
                                                            offset: Offset(
                                                                0.0, 0.75))
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          // const Padding(padding: EdgeInsets.all(4)),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(6),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .5,
                                                            decoration:
                                                                const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8)),
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0xC6FFFFFF),
                                                                  Color(
                                                                      0xC6FFFFFF)
                                                                ],
                                                                begin: Alignment
                                                                    .bottomCenter,
                                                                end: Alignment
                                                                    .topCenter,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  lms
                                                                      .subscriptions[
                                                                          index]
                                                                      .name,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black87,
                                                                  ),
                                                                  maxFontSize:
                                                                      15,
                                                                  minFontSize:
                                                                      12,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                AutoSizeText(
                                                                  "Mulai dari ${formatCurrency.format(double.parse(lms.subscriptions[index].subscription_prices![0].selling_price))}",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .teal,
                                                                  ),
                                                                  maxFontSize:
                                                                      13,
                                                                  minFontSize:
                                                                      11,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              lms.courseLoading
                                  ? HomeCourseShimmer()
                                  : Container(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 8, right: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const AutoSizeText(
                                                "Kursus",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxFontSize: 16,
                                                minFontSize: 14,
                                              ),
                                              GestureDetector(
                                                onTap: () => Get.to(
                                                  () =>
                                                      const CourseListScreen(),
                                                ),
                                                child: const AutoSizeText(
                                                  "Kursus Lainnya",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxFontSize: 15,
                                                  minFontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(6)),
                                          SizedBox(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 12),
                                              child: ListView.builder(
                                                itemCount: lms.courses.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (_, index) =>
                                                    GestureDetector(
                                                  onTap: () => {
                                                    Get.to(
                                                      () => CourseScreen(
                                                        courseId: lms
                                                            .courses[index].id,
                                                        lock: checkLock(
                                                            lms.courses[index],
                                                            lms.isLogin),
                                                      ),
                                                    ),
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 12),
                                                    child: ListCourseItem(
                                                      image: lms.courses[index]
                                                          .thumbnail!,
                                                      title: lms
                                                          .courses[index].title,
                                                      mentor: lms.courses[index]
                                                          .creator_name,
                                                      descriptions: lms
                                                          .courses[index]
                                                          .description!,
                                                      price: lms
                                                          .courses[index].price,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                            ]);
                  // });
                });
              });
            }),
          ),
        ),
      ),
    );
  }

  // void getInit() async {
  //   await Provider.of<ProductProvider>(context, listen: false).getProducts();
  // }

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
