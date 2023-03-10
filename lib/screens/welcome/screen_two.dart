import 'package:lentera_ilmu/controllers/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_ilmu/screens/welcome/screen_three.dart';

class WelcomeScreenTwo extends StatelessWidget {
  WelcomeScreenTwo({Key? key}) : super(key: key);
  final welcomeController = Get.put(WelcomeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            Get.back();
          }
          // Swiping in left direction.
          if (details.delta.dx < 0) {
            Get.to(
              () => WelcomeScreenThree(),
              transition: Transition.rightToLeft,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://assets.pesantrenqu.id/assets?dir=test&file=11331ed9-e7ec-442a-bb22-fbd4bf58edf7.png',
                        width: MediaQuery.of(context).size.width * .7,
                      ),
                      const Padding(padding: EdgeInsets.all(12)),
                      const Center(
                        child: Text(
                          "Berjejaring",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(12)),
                      const Center(
                        child: Text(
                          "Membangun bisnis secara kolaboratif.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  flex: 9,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Container(
                                  color: Colors.black45,
                                  width: 8,
                                  height: 8,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              ClipOval(
                                child: Container(
                                  color: Colors.black45,
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              ClipOval(
                                child: Container(
                                  color: Colors.black45,
                                  width: 8,
                                  height: 8,
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(8)),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
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
                                () => WelcomeScreenThree(),
                                transition: Transition.rightToLeft,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                  color: Colors.teal,
                                ),
                                padding: const EdgeInsets.all(0),
                                child: const Text(
                                  "Selanjutnya",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => {Get.back()},
                          child: const Text(
                            'Sebelumnya',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => {welcomeController.setWelcome()},
                          child: const Text(
                            'Lewati',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ],
                    ),
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
