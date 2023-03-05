import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Obx(() => 
       (controller.productTotalSub != null || controller.productTotalSub == 0) ? 
       const SizedBox.shrink() 
       : Container(
          height: size.height * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              const Text('Total', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
             
              RichText(
                text: TextSpan(
                  text: '${controller.productTotalSub} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900, 
                    fontSize: 22,
                     color: Colors.black),
                  children: const [
                    TextSpan(text: 'XOF', 
                    style: TextStyle(
                      fontSize: 20
                    ))
                  ]
                ),
              ),
            ],
          ),
        ),
      );
  }
}
