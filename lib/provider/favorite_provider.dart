import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food_item_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FoodItemModel> _favorites = [];
  List<FoodItemModel> get favorites => _favorites;
  void toggleFavorite(FoodItemModel product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      if (!_favorites.contains(product)) {
        _favorites.add(product);
      }
    }
    notifyListeners();
  }

  bool isExist(FoodItemModel product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
