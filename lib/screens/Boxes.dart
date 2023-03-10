// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:lentera_ilmu/models/user/alamat/userModel.dart';

class Boxes {
  static Box<UserModel> getUsers() => Hive.box('alamat');
}
