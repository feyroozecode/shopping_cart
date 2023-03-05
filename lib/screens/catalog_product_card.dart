import 'package:flutter/material.dart';
import 'package:shopping_cart/controllers/product_controller.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flexible(
          child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              return _CatalogProductCard(index);
            },
          ),
        ));
  }
}

@immutable
class _CatalogProductCard extends StatelessWidget {
  _CatalogProductCard(this.index);

  int index;

  final cartController = Get.put(CartController());

  ProductController productController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(productController.products[index].imageUrl),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                productController.products[index].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Expanded(
              child: Text('${productController.products[index].price}'),
            ),
            IconButton(
                onPressed: () {
                  cartController
                      .addProdct(productController.products[index]); // add product to a list
                },
                icon: const Icon(Icons.add))
          ],
        ));
  }
}
