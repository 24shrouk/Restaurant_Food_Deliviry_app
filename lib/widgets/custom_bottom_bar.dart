import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/cart_page.dart';
import 'package:restaurant_app/views/favorite_page.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/views/profile_page.dart';

class CustomBottombar extends StatefulWidget {
  CustomBottombar({
    super.key,
  });

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  int currentIndex = 0;
  late List<Widget> pages;
  late HomePage homePage;
  late ProfilePage profilePage;
  late FavoritePage favoritePage;
  late CartPage cartPage;
  @override
  void initState() {
    homePage = const HomePage();

    favoritePage = const FavoritePage();
    cartPage = const CartPage();
    profilePage = const ProfilePage();
    pages = [homePage, favoritePage, cartPage, profilePage];
    super.initState();
  }

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
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: pages[currentIndex],
    );
  }
}
