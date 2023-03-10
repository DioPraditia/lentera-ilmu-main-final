// ignore_for_file: unused_import

import "package:flutter/material.dart";

import "package:get/get.dart";
import "package:lentera_ilmu/theme.dart";
import "package:auto_size_text/auto_size_text.dart";

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class FormAddress extends StatefulWidget {
  const FormAddress({Key? key}) : super(key: key);

  @override
  State<FormAddress> createState() => _FormAddressState();
}

class _FormAddressState extends State<FormAddress> {
  bool isChecked = false;

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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Alamat"),
        backgroundColor: Colors.teal,
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
                  child: TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.add_home_work_outlined),
                      labelText: "Rumah/Apartement/Kantor/Kos",
                    ),
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Nama Penerima")),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                    decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.contact_page_outlined),
                  labelText: "Nomor Hp",
                )),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                    decoration: const InputDecoration(
                  labelText: "Alamat Lengkap & Kode Pos",
                  suffixIcon: Icon(Icons.location_city_outlined),
                )),
              ),
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
                        onPressed: () => null,
                        child: const Text(
                          "Simpan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 43,
                    ),
                    TextButton(
                      onPressed: () => null,
                      child: const Text(
                        "Hapus",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
