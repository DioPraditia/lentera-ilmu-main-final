import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_ilmu/controllers/auth.dart';
import 'package:lentera_ilmu/controllers/profile.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreen createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  final profileController = Get.put(ProfileController());
  final loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    loginController.setResetPasswordMessage();
  }

  @override
  void dispose() {
    super.dispose();
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
            "Reset Password",
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
        body: GetBuilder<LoginController>(builder: (auth) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 0.5),
                )
              ],
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/img/auth/reset_password.png",
                    width: MediaQuery.of(context).size.width * .40,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AutoSizeText(
                      "Peringatan",
                      maxFontSize: 14,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Column(
                  children: [
                    const Divider(
                      height: 8,
                      thickness: 1.3,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.orange.shade800,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey.shade600,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text:
                                        "Sebelum melakukan reset password, pastikan anda dapat mengakses email yang terdaftar.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.orange.shade800,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey.shade600,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text:
                                        "Password baru akan dikirim ke email ",
                                  ),
                                  TextSpan(
                                    text: profileController.status?.user.email,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(6)),
                auth.resetPasswordSuccess
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "Password baru telah dikirim ke email Anda.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(),
                const Padding(padding: EdgeInsets.all(6)),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                    onPressed: () => auth.resetPassword(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: Colors.teal,
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        auth.loading ? "Memproses..." : "Reset",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
