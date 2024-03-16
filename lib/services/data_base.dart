import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future updateFoodItem(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance.doc(id).update(userInfoMap);
  }

  Future addFoodItemToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .doc(id)
        .collection('users')
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
