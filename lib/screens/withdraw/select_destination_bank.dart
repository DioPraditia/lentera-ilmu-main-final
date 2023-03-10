import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_ilmu/controllers/payment.dart';
import 'package:lentera_ilmu/screens/profile/setting/bank/create_account_bank_screen.dart';

class SelectDestinationBank extends StatefulWidget {
  const SelectDestinationBank({Key? key}) : super(key: key);

  @override
  _SelectDestinationBank createState() => _SelectDestinationBank();
}

class _SelectDestinationBank extends State<SelectDestinationBank> {
  final paymentController = Get.put(PaymentController());
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    paymentController.getListBankAccount(page: 0, resetData: true);
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      paymentController.getListBankAccount(
          page: paymentController.lastPage + 1, resetData: false);
    }
    if (scrollController.offset <= 0) {
      paymentController.getListBankAccount(page: 0, resetData: true);
    }
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    paymentController.getListBankAccount(page: 0, resetData: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      // onGenerateInitialRoutes: (_) => lmsController.getCourse(widget.course.id),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const AutoSizeText(
            "Pilih Rekening Tujuan",
            maxFontSize: 16,
          ),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => {
              Get.back(),
            },
          ),
        ),
        body: RefreshIndicator(
          color: Colors.teal,
          onRefresh: () => refreshData(),
          child: GetBuilder<PaymentController>(
            builder: (payment) {
              return payment.loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    )
                  : payment.userbanks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/img/empty/coming_soon.png",
                                width: MediaQuery.of(context).size.width * .60,
                              ),
                              const Padding(padding: EdgeInsets.all(14)),
                              const Text(
                                  "Ups... Kamu belum memiliki akun bank."),
                              const Padding(padding: EdgeInsets.all(24)),
                            ],
                          ),
                        )
                      : ListView.separated(
                          controller: scrollController,
                          itemCount: payment.userbanks.length,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () => {
                                payment.selectUserBank(payment.userbanks[i]),
                                Get.back()
                              },
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          payment.userbanks[i].bank_icon,
                                          width: 38,
                                        ),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 12)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                                padding: EdgeInsets.all(2)),
                                            AutoSizeText(
                                              payment.userbanks[i].bank_name,
                                              maxFontSize: 12,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.all(2)),
                                            AutoSizeText(
                                              payment
                                                  .userbanks[i].account_holder
                                                  .toUpperCase(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              maxFontSize: 23,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.all(2)),
                                            AutoSizeText(
                                              payment
                                                  .userbanks[i].account_number
                                                  .toUpperCase(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              maxFontSize: 23,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.play_arrow,
                                      size: 24,
                                      color: Colors.teal,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        );
            },
          ),
        ),
        floatingActionButton: GetBuilder<PaymentController>(builder: (payment) {
          return payment.destionationBanks.isEmpty
              ? Container()
              : FloatingActionButton(
                  onPressed: () =>
                      Get.to(() => const CreateAccountBankScreen()),
                  backgroundColor: Colors.teal,
                  child: const Icon(Icons.add),
                );
        }),
      ),
    );
  }
}
