import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    _buildProductQuatity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: Icon(
            icon,
            size: 15,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          finalList[index].quantity = 1;
                          finalList.removeAt(index);
                          setState(() {});
                        },
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      )
                    ]),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  finalList[index].image,
                                ),
                                backgroundColor: Colors.red.shade100,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 30,
                            // ),
                            Column(
                              children: [
                                Text(
                                  finalList[index].itemName,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${finalList[index].price}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   width: 150,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                _buildProductQuatity(Icons.add, index),
                                Text(
                                  finalList[index].quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                _buildProductQuatity(Icons.remove, index)
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //ListTile(
                    //   title: Text(
                    //     finalList[index].itemName,
                    //     style: const TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     '\$${finalList[index].price}',
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    //   leading: CircleAvatar(
                    //     radius: 50,
                    //     backgroundImage: NetworkImage(
                    //       finalList[index].image,
                    //     ),
                    //     backgroundColor: Colors.red.shade100,
                    //   ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${provider.getTotalPrice()}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                    label: const Text(
                      "Check out",
                      style: TextStyle(color: kPrimaryColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
