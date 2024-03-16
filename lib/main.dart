import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/cart_provider.dart';
import 'package:restaurant_app/provider/favorite_provider.dart';
import 'package:restaurant_app/views/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FavoriteProvider>(
            create: (_) => FavoriteProvider(),
          ),
          // Add other providers if needed
        ],
        // MultiProvider(
        //     providers: [
        //       ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        //       ChangeNotifierProvider(create: (_) => CartProvider()),
        //     ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplachScreen(),
        ));
  }
}
