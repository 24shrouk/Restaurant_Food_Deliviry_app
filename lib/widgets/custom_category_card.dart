import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 80,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 252, 250, 250),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/categore1.png',
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
