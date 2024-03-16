// import 'package:dio/dio.dart';
// import 'package:restaurant_app/models/api_modal.dart';

// class FoodService {
//   final Dio dio;
//   FoodService(this.dio);
//   Future<List<FoodItem>> getFoodCategory() async {
//     try {
//       Response response = await dio.get(
//           'https://github.com/igdev116/free-food-menus-api/blob/main/menus/sandwiches.json');
//       List<dynamic> jsonData = response.data;
//       List<dynamic> foods = jsonData;
//       List<FoodItem> foodList = [];
//       for (var food in foods) {
//         FoodItem foodItem = FoodItem.fromJson(food);
//         foodList.add(foodItem);
//       }
//       return foodList;
//     } catch (e) {
//       return [];
//     }
//   }
// }
