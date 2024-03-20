import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/models/food_item_model.dart';
import 'package:restaurant_app/provider/favorite_provider.dart';
import 'package:restaurant_app/views/order_details_screen.dart';

class AllItemsWidget extends StatefulWidget {
  const AllItemsWidget({
    super.key,
    required this.context,
    required this.fooditemStream,
    this.onTap,
  });

  final BuildContext context;
  final Stream? fooditemStream;
  final void Function()? onTap;

  @override
  State<AllItemsWidget> createState() => _AllItemsWidgetState();
}

class _AllItemsWidgetState extends State<AllItemsWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: widget.fooditemStream,
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: widget.onTap ??
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderDetails(
                                                image: ds['Image'],
                                                name: ds['Name'],
                                                price: ds['Price'],
                                                description: ds['Description'],
                                                product: FoodItemModel(
                                                    id: ds['id'],
                                                    itemName: ds['Name'],
                                                    price:
                                                        int.parse(ds['Price']),
                                                    image: ds['Image']),
                                              )));
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 200,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.transparent,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            ds['Image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ds['Name'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              '\$' + ds['Price'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                provider.toggleFavorite(
                                                    FoodItemModel(
                                                        itemName: ds['Name'],
                                                        price: int.parse(
                                                            ds['Price']),
                                                        image: ds['Image'],
                                                        id: ds['id']));
                                              },
                                              child: Icon(
                                                provider.isExist(FoodItemModel(
                                                        itemName: ds['Name'],
                                                        price: int.parse(
                                                            ds['Price']),
                                                        image: ds['Image'],
                                                        id: ds['id']))
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_outlined,
                                                color: kPrimaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  );
          }),
    );
  }
}
