import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/cart_page.dart';
import 'package:restaurant_app/views/favorite_page.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/views/profile_page.dart';

class CustomBottombar extends StatefulWidget {
  const CustomBottombar({
    super.key,
  });

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
            return const ProfilePage();
          }));
        }
      },
    );
  }
}
