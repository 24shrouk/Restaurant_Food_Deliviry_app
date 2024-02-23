import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/cart_page.dart';
import 'package:restaurant_app/views/favorite_page.dart';
import 'package:restaurant_app/views/profile_page.dart';
import 'package:restaurant_app/widgets/custom_category_card.dart';
import 'package:restaurant_app/widgets/custom_menu_card.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
        color: kPrimaryColor,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FavoritePage();
            }));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartPage();
            }));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage();
            }));
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
