import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food_item_model.dart';
import 'package:restaurant_app/views/order_details_screen.dart';

class SearchFunctions extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final CollectionReference foodItemsCollection =
        FirebaseFirestore.instance.collection('AllItems');

    return StreamBuilder<QuerySnapshot>(
      stream: foodItemsCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<FoodItemModel> products = snapshot.data!.docs.map((doc) {
          return FoodItemModel(
              description: doc['Description'],
              id: doc['id'],
              itemName: doc['Name'],
              price: int.parse(doc['Price']),
              image: doc['Image']);
        }).toList();

        final List<FoodItemModel> results = snapshot.data!.docs
            .map(
          (doc) => FoodItemModel(
              description: doc['Description'],
              id: doc['id'],
              itemName: doc['Name'],
              price: int.parse(doc['Price']),
              image: doc['Image']),
        )
            .where((item) {
          final name = item.itemName.toLowerCase();
          return name.contains(query.toLowerCase());
        }).toList();

        return ListView.builder(
          itemCount: query == '' ? products.length : results.length,
          itemBuilder: (context, index) {
            final item = query == '' ? products[index] : results[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetails(
                        description: products[index].description!,
                        image: products[index].image,
                        name: products[index].itemName,
                        price: products[index].price.toString(),
                        product: products[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              item.image,
                            ),
                            backgroundColor: Colors.red.shade100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          item.itemName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final CollectionReference foodItemsCollection =
        FirebaseFirestore.instance.collection('AllItems');

    return StreamBuilder<QuerySnapshot>(
        stream: foodItemsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<FoodItemModel> results = snapshot.data!.docs
              .map(
            (doc) => FoodItemModel(
                id: doc['id'],
                itemName: doc['Name'],
                price: int.parse(doc['Price']),
                image: doc['Image']),
          )
              .where((item) {
            final name = item.itemName.toLowerCase();
            return name.contains(query.toLowerCase());
          }).toList();

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final item = results[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              item.image,
                            ),
                            backgroundColor: Colors.red.shade100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          item.itemName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
