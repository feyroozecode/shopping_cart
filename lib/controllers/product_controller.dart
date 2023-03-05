import 'package:get/get.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/services/services.dart';

class ProductController extends GetxController {
  // adb product observer
  final products = <Product>[].obs;

  @override
  void onInit() {
    // 
    products.bindStream(FirestoreDB().getAllproducts()); 
    super.onInit();
  }
}
