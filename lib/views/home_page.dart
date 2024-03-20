import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/services/data_base.dart';
import 'package:restaurant_app/widgets/all_items_widget.dart';
import 'package:restaurant_app/widgets/custom_category_card.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? fooditemStream;

  onLoad() async {
    fooditemStream = await DataBaseMethods().getFoodItem('Popural Food');
    setState(() {});
  }

  @override
  void initState() {
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          iconTheme: const IconThemeData(size: 20, color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            child: Text(
                              userData['userName']
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Hi ' + (userData['userName'])!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              )),
                        ],
                      ),
                      const Text(
                        'Ready for order',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 60,
                        child: CustomSearchcontainer(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Select Category',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomCategoryCard(
                                  image: 'assets/images/pizzacat.jpeg',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Pizza');
                                    setState(() {});
                                  }),
                              CustomCategoryCard(
                                  image: 'assets/images/burger.png',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Burger');
                                    setState(() {});
                                  }),
                              CustomCategoryCard(
                                  image: 'assets/images/shawrma.png',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Shawrma');
                                    setState(() {});
                                  }),
                              CustomCategoryCard(
                                  image: 'assets/images/salad.png',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Salad');
                                    setState(() {});
                                  }),
                              CustomCategoryCard(
                                  image: 'assets/images/images.jpeg',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Drinks');
                                    setState(() {});
                                  }),
                              CustomCategoryCard(
                                  image: 'assets/images/ice_cream.png',
                                  onTap: () async {
                                    fooditemStream = await DataBaseMethods()
                                        .getFoodItem('Ice-Cream');
                                    setState(() {});
                                  }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Popular Food',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Container(
                              child: AllItemsWidget(
                        context: context,
                        fooditemStream: fooditemStream,
                      ))),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
