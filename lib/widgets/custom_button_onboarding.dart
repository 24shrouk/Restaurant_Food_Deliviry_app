import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/home_page.dart';

class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Color.fromARGB(255, 67, 67, 67),
          size: 40,
          weight: 5,
        ),
      ),
    );
  }
}
