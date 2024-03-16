// import 'package:flutter/material.dart';
// import 'package:restaurant_app/widgets/card.dart';

// class FoodCard extends StatefulWidget {
//   const FoodCard({super.key});

//   @override
//   State<FoodCard> createState() => _FoodCardState();
// }

// class _FoodCardState extends State<FoodCard> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: const Color.fromARGB(255, 249, 246, 241),
//         ),
//         child: SizedBox(
//           child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 10,
//               clipBehavior: Clip.none,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.9,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return const CustomCard();
//               }),
//         ),
//       ),
//     );
//   }
// }
