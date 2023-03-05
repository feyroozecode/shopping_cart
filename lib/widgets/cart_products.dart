import 'package:flutter/material.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/models/Product.dart';

class CartProducts extends StatelessWidget {
  CartProducts({Key? key}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Obx(() => 
        SizedBox(
          // Observe and update the change on the widget
          height: size.height * 0.65,
          child: controller.products.length != null ? 
            const Center( child: Center(child: Text('panier vide ')))
            : 
            ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );  
            },
          ), 
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.name),
          ),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: const Icon(Icons.remove_circle)),
          Text('$quantity'),
          IconButton(
              onPressed: () {
                controller.addProdct(product);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
