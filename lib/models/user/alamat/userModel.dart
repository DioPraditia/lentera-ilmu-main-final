// ignore_for_file: file_names

import 'package:hive/hive.dart';
part 'userModel.g.dart';

@HiveType(typeId: 0) //This is Model Class Type ID
class UserModel extends HiveObject {
  @HiveField(0) // This is field index
  // ignore: non_constant_identifier_names
  String? lebel_tempat;

  @HiveField(1)
  String? nama;

  @HiveField(2)
  // ignore: non_constant_identifier_names
  String? nomor_hp;

  @HiveField(3)
  // ignore: non_constant_identifier_names
  String? alamat_lengkap;

  // @HiveField(4)
  // // ignore: non_constant_identifier_names
  // late String kota_asal;

  // @HiveField(5)
  // // ignore: non_constant_identifier_names
  // late String alamat_lengkap;
}
