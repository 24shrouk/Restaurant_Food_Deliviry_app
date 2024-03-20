import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/models/food_item_model.dart';
import 'package:restaurant_app/provider/cart_provider.dart';
import 'package:restaurant_app/views/cart_page.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails(
      {super.key,
      required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.product});

  String name, price, description, image;
  final FoodItemModel product;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // int a = 1;
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image,
                height: MediaQuery.of(context).size.height / 5, //150,
                width: MediaQuery.of(context).size.width / 1.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Text(
                  r'Price : $' + widget.price,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 170,
                ),
                // GestureDetector(
                //   onTap: () {
                //     if (a > 1) {
                //       --a;
                //     }
                //     setState(() {});
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(4),
                //       color: kPrimaryColor,
                //     ),
                //     height: 20,
                //     width: 20,
                //     child: const Icon(
                //       Icons.remove,
                //       color: Colors.white,
                //       size: 20,
                //     ),
                //   ),
                // ),
                // // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     a.toString(),
                //     style: const TextStyle(
                //         fontSize: 18, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     ++a;
                //     setState(() {});
                //   },
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     color: kPrimaryColor,
                //   ),
                //   height: 20,
                //   width: 20,
                //   child: const Icon(
                //     Icons.add,
                //     color: Colors.white,
                //     size: 20,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  maxLines: null,
                  style: TextStyle(
                      fontSize: 28, color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            // Text(
            //   r'Total Price : $ ' + (a * int.parse(widget.price)).toString(),
            //   style: const TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // ),
            // const SizedBox(
            //   height: 50,
            // ),
            GestureDetector(
              onTap: () async {
                provider.toggleProduct(widget.product);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
