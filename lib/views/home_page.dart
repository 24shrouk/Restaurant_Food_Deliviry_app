import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/widgets/custom_bottom_bar.dart';
import 'package:restaurant_app/widgets/custom_category_card.dart';
import 'package:restaurant_app/widgets/custom_menu_card.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: const IconThemeData(size: 20, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: const CustomBottombar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Container(
                    child: const Text(
                      'S',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Hi Shrouk',
                    style: TextStyle(
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
            Container(
              height: 60,
              width: 270,
              child: const CustomTextField(),
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
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: const CustomCategoryCard());
                    })),
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
            const Expanded(child: foodCard()),
          ],
        ),
      ),
    );
  }
}
