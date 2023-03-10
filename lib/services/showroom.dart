import 'package:lentera_ilmu/models/showroom/showroom.dart';
import 'package:lentera_ilmu/services/service.dart';

class ShowroomService extends ServiceAPI {
  Future<List<ShowroomModel>> getShowrooms() async {
    try {
      final result = await get("$baseUrlShowroom/showroom/list");
      return result["items"]
          .map<ShowroomModel>((json) => ShowroomModel.fromJson(json))
          .toList();
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<dynamic>> getShowroomTransactions() async {
    try {
      final result = await get("$baseUrlShowroom/showroom/transactions");
      return result["items"].map((json) => json).toList();
    } catch (e) {
      throw '$e';
    }
  }

  Future<dynamic> showroomPayment(
      {required int showroomId,
      required int showroomVariantId,
      required int price,
      required int shippingcost,
      required String address,
      required Payment payment}) async {
    try {
      final result = await post(
        "$baseUrlShowroom/showroom/transactions",
        data: {
          'showroom_id': showroomId,
          'showroom_variant_id': showroomVariantId,
          'price': price,
          "shipping_cost": shippingcost,
          "address": address,
          "payment": payment
        },
      );
      return result["items"].map((json) => json).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}

class Payment {
  String type;
  String provider;
  Payment({required this.type, required this.provider});
}
