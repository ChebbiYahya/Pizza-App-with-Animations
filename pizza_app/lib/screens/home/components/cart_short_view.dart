import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../controllers/home_controller.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: defaultPadding),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.cart.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding / 2),
                    child: Hero(
                      tag: controller.cart[index].product!.title! + "_cartTag",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(controller.cart[index].product!.image!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              controller.totalCartItems().toString(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
