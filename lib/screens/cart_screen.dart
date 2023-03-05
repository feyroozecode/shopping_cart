import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/cart_products.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              //elevation: 2.0,
              title: const Text(
                "Votre Panier",
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
              centerTitle: true,
            ),
            body: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartProducts(),
                  CatrtTotal(),
                ],
              ),
            )));
  }
}
