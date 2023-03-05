import 'package:get/get.dart';
import 'package:shopping_cart/models/Product.dart';

class CartController extends GetxController {
  // add a dictionnary to store the products in the cart
  var _products = {}
      .obs; // obs is for observing the value of the dict like observable list in C#

  // add products
  void addProdct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1; // if product already exisit add +1
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
        'Ajout dans le panier', 'Vous avez ajouter ${product.name} au panier',
        animationDuration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }

  // get all products
  get products => _products;

  // remove product
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  // get suTotal
  get productTotalSub => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  // get total

  // create t
}
