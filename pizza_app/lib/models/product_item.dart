import 'package:pizza_app/models/product.dart';

class ProductItem {
  int quantity;
  final Product? product;
  ProductItem({
    this.quantity = 1,
    required this.product,
  });
  void increment() {
    quantity++;
  }
}

// void add() {}

// void substract() {}
