import 'package:flutter/material.dart';
import 'package:restaurant_app/admin/update_food.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/services/data_base.dart';
import 'package:restaurant_app/widgets/all_items_widget.dart';
import 'package:restaurant_app/widgets/custom_category_card.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class HomeAdminUpdatePage extends StatefulWidget {
  const HomeAdminUpdatePage({
    super.key,
  });

  @override
  State<HomeAdminUpdatePage> createState() => _HomeAdminUpdatePageState();
}

class _HomeAdminUpdatePageState extends State<HomeAdminUpdatePage> {
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: const IconThemeData(size: 20, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Row(
            //   children: [
            //     CircleAvatar(
            //       backgroundColor: kPrimaryColor,
            //       child: Text(
            //         'S',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text('Hi Shrouk',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 24,
            //         )),
            //   ],
            // ),
            // const Text(
            //   'Ready for order',
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 28,
            //       fontWeight: FontWeight.w900),
            // ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 60,
              width: 270,
              child: CustomTextField(),
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
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Pizza');
                          setState(() {});
                        }),
                    CustomCategoryCard(
                        image: 'assets/images/burger.png',
                        onTap: () async {
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Burger');
                          setState(() {});
                        }),
                    CustomCategoryCard(
                        image: 'assets/images/shawrma.png',
                        onTap: () async {
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Shawrma');
                          setState(() {});
                        }),
                    CustomCategoryCard(
                        image: 'assets/images/salad.png',
                        onTap: () async {
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Salad');
                          setState(() {});
                        }),
                    CustomCategoryCard(
                        image: 'assets/images/images.jpeg',
                        onTap: () async {
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Drinks');
                          setState(() {});
                        }),
                    CustomCategoryCard(
                        image: 'assets/images/ice_cream.png',
                        onTap: () async {
                          fooditemStream =
                              await DataBaseMethods().getFoodItem('Ice-Cream');
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateFood()));
              },
              context: context,
              fooditemStream: fooditemStream,
            ))),
            // const Expanded(child: FoodCard()),
          ],
        ),
      ),
    );
  }
}
