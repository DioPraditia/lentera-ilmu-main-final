import 'package:get/get.dart';
import 'package:lentera_ilmu/core.dart';
import 'package:lentera_ilmu/models/product/product.dart';
import 'package:lentera_ilmu/services/product.dart';

class ProductController extends GetxController {
  final productService = ProductService();
  late List<ProductModel> products = <ProductModel>[].obs;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future getProducts() async {
    loading = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    try {
      products = await productService.getProducts();
      loading = false;
      update();
    } catch (e) {
      showErrorMessage(e.toString());
      loading = false;
      update();
    }
  }
}
