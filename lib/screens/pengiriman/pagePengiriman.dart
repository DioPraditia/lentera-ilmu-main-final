import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_ilmu/screens/address/addressform.dart';
import 'package:lentera_ilmu/screens/profile/daftaralamat_screen.dart';
import 'package:lentera_ilmu/screens/reward/reward_detil.dart';
import 'package:lentera_ilmu/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PengirimanPage extends StatefulWidget {
  const PengirimanPage({Key? key}) : super(key: key);

  @override
  State<PengirimanPage> createState() => _PengirimanPageState();
}

class _PengirimanPageState extends State<PengirimanPage> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 250),
          child: AutoSizeText(
            "Pengiriman",
            maxFontSize: 16,
          ),
        ),
        // actions: const [],
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Alamat Pengiriman",
                        style: blackpekatTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 123),
                      child: GestureDetector(
                        onTap: () => Get.to(
                          () => FormAddress(),
                        ),
                        child: Text(
                          "Pilih Alamat Lain",
                          style: AlamatlainTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 343,
                    top: 18,
                  ),
                  child: Text(
                    "Rumah",
                    style: blackpekatTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 7,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'John',
                        style: NamauserTextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(089930102340)",
                        style: NamauserTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 152,
                    top: 5,
                  ),
                  child: Text(
                    "Jl. Cimahi Raya. Kec. Cisarua, Kota Bogor",
                    style: NamauserTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 209,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFFBFFFE),
                          Color.fromRGBO(211, 226, 222, 1),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/img/Iconn.png",
                                    width: 160,
                                  ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Image.asset(
                                    "assets/img/Gambarr.png",
                                    width: 160,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 113,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Buruan!.. Dapatkan Rewardnya\nSekarang.",
                                    style: BannerTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 240,
                                  ),
                                  child: SizedBox(
                                    width: 106,
                                    height: 41,
                                    child: ElevatedButton(
                                        child: const Text(
                                          "Cek Reward",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.all(14)),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.teal),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              side: BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => Get.to(
                                              () => RewardDetil(),
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: 91,
                      height: 83,
                      decoration: BoxDecoration(
                        color: const Color(0XFFFF3F3F3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          "assets/img/Filosofi-Teras.png",
                          width: 45,
                          height: 70,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Filosofi Teras Edisi Baru-Filsafat\nYunani-Romawi-Kuno",
                            style: TitleRingkasanTextStyle,
                          ),
                          Text(
                            "\nRp.98.000,-",
                            style: TitleRingkasanTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButtonFormField(
                    value: _value,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Pilih Pengiriman',
                        style: TitleProdukTextStyle,
                      ),
                    ),
                    decoration: InputDecoration(
                      suffixIcon: _value == null
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => setState(() {
                                    _value = null;
                                  })),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Image.asset(
                          "assets/img/Kapal 1.png",
                          width: 61,
                          height: 36,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    onChanged: (newValue) => setState(() {
                      _value = newValue as String?;
                    }),
                    items: <String>['JNE', 'TIKI', 'POS']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(thickness: 7),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Ringkasan",
                      style: TitleRingkasanTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 17, left: 7),
                      child: Text(
                        "Total harga",
                        style: TextTotalTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 243,
                    ),
                    Text(
                      "Rp98.000",
                      style: TextTotalTextStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 7,
                      ),
                      child: Text(
                        "Total Ongkos Kirim",
                        style: TextTotalTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 193,
                    ),
                    Text(
                      "Rp11.000",
                      style: TextTotalTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(thickness: 7),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 7),
                  child: Row(
                    children: [
                      Text(
                        "Dengan membayar, saya menyetujuinya",
                        style: TitlemenyetujuiTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Rp0", //Text Harga di keranjang
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxFontSize: 18,
                      ),
                      SizedBox(
                        width: 220,
                        height: 60,
                        child: ElevatedButton(
                          child: Text(
                            "Pilih Pembayaran",
                            style: PembayaranTextStyle,
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(14)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(19),
                                ),
                                side: BorderSide(color: Colors.teal),
                              ),
                            ),
                          ),
                          onPressed: () => null,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
