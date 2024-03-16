// import 'package:flutter/material.dart';

// import 'package:restaurant_app/views/order_details_screen.dart';

// class CustomCard extends StatelessWidget {
//   const CustomCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const OrderDetails()));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16), color: Colors.white),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   'assets/images/burger.png',
//                   height: 80,
//                   width: 150,
//                 ),
//                 const Text(
//                   'pizza',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 2,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$25',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Icon(
//                       Icons.favorite,
//                       color: Colors.red,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
