import 'package:flutter/material.dart';

import 'package:restaurant_app/widgets/search.dart';

class CustomSearchcontainer extends StatelessWidget {
  const CustomSearchcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: SearchFunctions());
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 240, 238, 238),
        ),
        child: const Row(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.search_outlined,
              size: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 181, 180, 180),
            ),
          ),
        ]),
      ),
    );

    // TextField(
    //   decoration: InputDecoration(
    //       prefixIcon: const Icon(
    //         Icons.search_outlined,
    //         size: 35,
    //       ),
    //       hintText: 'Search',
    //       hintStyle: const TextStyle(
    //         fontSize: 24,
    //         color: Color.fromARGB(255, 181, 180, 180),
    //       ),
    //       prefixIconColor: const Color.fromARGB(255, 181, 180, 180),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: const BorderSide(
    //           color: Color.fromARGB(255, 236, 233, 233),
    //         ),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: const BorderSide(
    //           color: kPrimaryColor,
    //         ),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(20),
    //           borderSide: const BorderSide(
    //             color: Color.fromARGB(255, 236, 233, 233),
    //           ))),
    // );
  }
}
