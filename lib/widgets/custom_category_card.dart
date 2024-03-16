import 'package:flutter/material.dart';

class CustomCategoryCard extends StatefulWidget {
  const CustomCategoryCard({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String? image;
  final void Function()? onTap;

  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 249, 249),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.image!,
                height: 30,
                width: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
