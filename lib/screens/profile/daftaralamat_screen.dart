import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lentera_ilmu/models/user/alamat/userModel.dart';
import 'package:lentera_ilmu/screens/boxes.dart';
import 'package:lentera_ilmu/screens/getAlamatFormField.dart';
import 'package:lentera_ilmu/theme.dart';

class DaftarAlamat extends StatefulWidget {
  const DaftarAlamat({Key? key}) : super(key: key);

  @override
  State<DaftarAlamat> createState() => _DaftarAlamatState();
}

class _DaftarAlamatState extends State<DaftarAlamat> {
  final _formKey = GlobalKey<FormState>();

  final conLabel = TextEditingController();
  final conName = TextEditingController();
  final conNomor = TextEditingController();
  final conAlamat = TextEditingController();

  bool isChecked = false;

  clearPage() {
    conLabel.text = '';
    conName.text = '';
    conNomor.text = '';
    conAlamat.text = '';
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.teal;
    }
    return Colors.grey;
  }

  @override
  void dispose() {
    Hive.close();

    // Hive.box('alamat').close();

    super.dispose();
  }

  Future<void> addAlamat(
    String uLabel,
    String uName,
    String uNomor,
    String uAlamat,
  ) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final User = UserModel()
        ..lebel_tempat = uLabel
        ..nama = uName
        ..nomor_hp = uNomor
        ..alamat_lengkap = uAlamat;
      // ..kota = uKota
      // ..alamat_lengkap = uAlamat;

      final box = Boxes.getUsers();
      //Key Auto Increment
      box.add(User).then((value) => clearPage);
    }
  }

  Future<void> editAlamat(UserModel userModel) async {
    conLabel.text = userModel.lebel_tempat!;
    conName.text = userModel.nama!;
    conNomor.text = userModel.nomor_hp!;
    conAlamat.text = userModel.alamat_lengkap!;

    deleteAlamat(userModel);
  }

  Future<void> deleteAlamat(UserModel userModel) async {
    userModel.delete();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const AutoSizeText(
            "Daftar Alamat",
            maxFontSize: 16,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (() => Get.back()),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 30),
                    child: genAlamatFormField(
                        controller: conLabel,
                        hintName: "Rumah/Apartement/Kantor/Kos",
                        iconData: Icons.add_home_work_outlined)),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: genAlamatFormField(
                      controller: conName,
                      hintName: "Nama Penerima",
                      iconData: Icons.person_outline_outlined),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: genAlamatFormField(
                      controller: conNomor,
                      hintName: "Nomor Hp",
                      iconData: Icons.contact_page_outlined),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: genAlamatFormField(
                      controller: conAlamat,
                      hintName: "Alamat Lengkap & Kode Pos",
                      iconData: Icons.location_city_outlined),
                ),
                // genAlamatFormField(
                //     controller: conEmail,
                //     hintName: "Email",
                //     iconData: Icons.email_outlined),
                // SizedBox(height: size.height * 0.03),

                // SizedBox(height: size.height * 0.03),
                // Container(
                //   alignment: Alignment.center,
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 40,
                //   ),
                //   child: genAlamatFormField(
                //       controller: conId,
                //       hintName: "Kota Asal",
                //       iconData: Icons.location_city_outlined),
                // ),
                // SizedBox(height: size.height * 0.03),
                // Container(
                //   alignment: Alignment.center,
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 40,
                //   ),
                //   child: genAlamatFormField(
                //       controller: conId,
                //       hintName: "Alamat Lengkap & Kode Pos",
                //       iconData: Icons.add_location_alt_outlined),
                // ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text("Jadikan Alamat Utama")
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  height: 50,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 138, 134),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(95),
                            bottomRight: Radius.circular(200),
                            topLeft: Radius.circular(95),
                          ),
                          color: Colors.teal,
                        ),
                        child: TextButton(
                          onPressed: () => addAlamat(
                            conLabel.text,
                            conName.text,
                            conNomor.text,
                            conAlamat.text,
                          ),
                          child: const Text(
                            "Simpan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 43,
                      ),
                      TextButton(
                        onPressed: () => clearPage(),
                        child: const Text(
                          "Hapus",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      //ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     // ignore: deprecated_member_use
                      //     primary: Colors.white,
                      //     // minimumSize: const Size(50, 16),
                      //     // padding: const EdgeInsets.all(0),
                      //     // shape: RoundedRectangleBorder(
                      //     //   borderRadius: BorderRadius.circular(80.0),
                      //     // ),
                      //   ),
                      //   onPressed: () => addAlamat(
                      //     conLabel.text,
                      //     conName.text,
                      //     conNomor.text,
                      //     conAlamat.text,
                      //   ),

                      //   // child: Text("Batal"),
                      //   // alignment: Alignment.center,
                      //   // height: 50.0,
                      //   // width: size.width * 0.9,
                      //   // decoration: BoxDecoration(
                      //   //   borderRadius: BorderRadius.circular(80),
                      //   //   color: Colors.red,
                      //   // ),

                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 50.0,
                      //     width: size.width * 0.5,
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(95),
                      //         bottomRight: Radius.circular(200),
                      //         topLeft: Radius.circular(95),
                      //       ),
                      //       color: Colors.teal,
                      //     ),
                      //     padding: const EdgeInsets.all(0),
                      //     child: const Text(
                      //       "Simpan",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white),
                      //     ),
                      //   ),
                      // ),

                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.teal,
                      //     minimumSize: const Size(50, 16),
                      //     padding: const EdgeInsets.all(0),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(80.0),
                      //     ),
                      //   ),
                      //   onPressed: () => clearPage(),
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 50.0,
                      //     width: size.width * 0.4,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(80.0),
                      //       color: Colors.white,
                      //     ),
                      //     // padding: const EdgeInsets.all(0),
                      //     child: const Text(
                      //       "Batal",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold, color: Colors.teal),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SizedBox(
                  height: 500,
                  child: ValueListenableBuilder(
                      valueListenable: Boxes.getUsers().listenable(),
                      builder: (BuildContext context, Box box, Widget? child) {
                        final alamat = box.values.toList().cast<UserModel>();
                        return genContent(alamat);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget genContent(List<UserModel> User) {
    if (User.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Anda belum menambahkan alamat",
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: User.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ExpansionTile(
                title: Text.rich(
                  TextSpan(
                    text: User[index].lebel_tempat,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "\n${User[index].nama}",
                        style: rewardTextStyle,
                        children: [
                          TextSpan(
                            text: "\n${User[index].alamat_lengkap}",
                            style: subtitleTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),

                  maxLines: 2,
                  // style: const TextStyle(
                  //     fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(User[index].alamat_lengkap!),
                trailing: Text(User[index].nomor_hp!),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () => editAlamat(User[index]),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        ),
                        label: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => deleteAlamat(User[index]),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        label: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    }
  }
}
