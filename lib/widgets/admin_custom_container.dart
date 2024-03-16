import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';

class AdminCustomContainer extends StatelessWidget {
  const AdminCustomContainer({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });
  final String text;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: onTap,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 251, 250, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        image,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: kPrimaryColor),
                    )
                  ]),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
