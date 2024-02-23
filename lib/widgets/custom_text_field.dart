import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 35,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 181, 180, 180),
          ),
          prefixIconColor: const Color.fromARGB(255, 181, 180, 180),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 236, 233, 233),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 236, 233, 233),
              ))),
    );
  }
}
