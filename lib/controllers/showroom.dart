import 'package:get/get.dart';
import 'package:lentera_ilmu/core.dart';
import 'package:lentera_ilmu/models/showroom/showroom.dart';

import 'package:lentera_ilmu/services/showroom.dart';

class ShowroomController extends GetxController {
  final showroomService = ShowroomService();
  late List<ShowroomModel> showrooms = <ShowroomModel>[].obs;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    getShowrooms();
  }

  Future getShowrooms() async {
    loading = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    try {
      showrooms = await showroomService.getShowrooms();
      loading = false;
      update();
    } catch (e) {
      showErrorMessage(e.toString());
      loading = false;
      update();
    }
  }
}
