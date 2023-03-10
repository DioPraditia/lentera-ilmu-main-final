import 'package:lentera_ilmu/models/product/product.dart';
import 'package:lentera_ilmu/services/service.dart';

class ProductService extends ServiceAPI {
  Future<List<ProductModel>> getProducts() async {
    try {
      final result = await get("$baseUrlProduct/product/list");
      return result["items"]
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<dynamic>> getProductTransactions() async {
    try {
      final result = await get("$baseUrlProduct/product/transactions");
      return result["items"].map((json) => json).toList();
    } catch (e) {
      throw '$e';
    }
  }

  Future<dynamic> productPayment(
      {required int productId,
      required int productVariantId,
      required int price,
      required int shippingcost,
      required String address,
      required Payment payment}) async {
    try {
      final result = await post(
        "$baseUrlProduct/product/transactions",
        data: {
          'product_id': productId,
          'product_variant_id': productVariantId,
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
