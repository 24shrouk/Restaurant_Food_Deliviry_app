class FoodItemModel {
  String itemName;
  int price;
  int quantity;
  int id;
  String image;
  String? description;

  FoodItemModel(
      {required this.itemName,
      required this.price,
      this.quantity = 1,
      required this.image,
      required this.id,
      this.description});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodItemModel &&
        other.itemName == itemName &&
        other.price == price &&
        other.image == image &&
        other.description == description &&
        other.id == id;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        price.hashCode ^
        image.hashCode ^
        id.hashCode ^
        description.hashCode;
  }
}
