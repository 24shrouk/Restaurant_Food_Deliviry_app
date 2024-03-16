import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<FoodItemModel> _cart = [];
  List<FoodItemModel> get cart => _cart;
  void toggleProduct(FoodItemModel product) {
    if (_cart.contains(product)) {
      for (FoodItemModel elemnt in _cart) {
        elemnt.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) =>
      _cart[index].quantity > 1 ? _cart[index].quantity-- : 1;
  getTotalPrice() {
    double total = 0.0;
    for (FoodItemModel element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
