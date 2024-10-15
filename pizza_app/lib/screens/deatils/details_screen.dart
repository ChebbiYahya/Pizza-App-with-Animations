import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/models/product.dart';
import 'package:pizza_app/screens/deatils/components/cart_counter.dart';

import '../../components/fav_btn.dart';
import '../../components/price.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key, required this.product, required this.onProductAdd});
  final Product product;
  final VoidCallback onProductAdd;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String cartTag = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  cartTag = "_cartTag";
                });
                Navigator.pop(context);
              },
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      //appBar: ,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF8F8F8),
                  child: Hero(
                      tag: widget.product.title! + cartTag,
                      child: Image.asset(widget.product.image!)),
                ),
                const Positioned(
                  bottom: -20,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Price(amount: "20.00"),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                style: TextStyle(
                  color: Color(0xFFBDBDBD),
                  height: 1.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Pizza",
        style: TextStyle(color: Colors.black),
      ),
      actions: const [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
