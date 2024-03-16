import 'package:flutter/material.dart';
import 'package:restaurant_app/admin/add_food.dart';
import 'package:restaurant_app/admin/admin_home_update.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/login_page.dart';
import 'package:restaurant_app/widgets/admin_custom_container.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            " Taste Food",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: kPrimaryColor),
          ),
        ),
      ),
      body: Column(
        children: [
          AdminCustomContainer(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddFood()));
            },
            text: 'Add Food Item',
            image: 'assets/images/onboarding1.png',
          ),
          const SizedBox(
            height: 15,
          ),
          AdminCustomContainer(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeAdminUpdatePage()));
            },
            text: 'Update Food Item',
            image: 'assets/images/onboarding1.png',
          ),
          const SizedBox(
            height: 15,
          ),
          AdminCustomContainer(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddFood()));
            },
            text: 'Delete Food Item',
            image: 'assets/images/onboarding1.png',
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
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
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(180),
                                child: const Icon(
                                  Icons.logout_rounded,
                                  size: 50,
                                ),
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
