import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/admin/home_admin_page.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/widgets/customButton.dart';
import 'package:restaurant_app/widgets/customtextformfeild.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? userName;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        child: Stack(children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // gradient: const LinearGradient(colors: [
                //   Colors.orangeAccent,
                //   kPrimaryColor,
                //   Color.fromARGB(255, 248, 109, 67)
                // ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                color: Colors.white, //Color.fromARGB(237, 254, 138, 43),
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 180.0))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Let\'s start with \n     Admin',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          CustomTextFormFiled(
                            onChange: (data) {
                              userName = data;
                            },
                            hint: 'Enter your name',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextFormFiled(
                            onChange: (data) {
                              password = data;
                            },
                            hint: ' Enter your password',
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          CustomButton(
                            text: 'Login',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                loginAdmine();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  loginAdmine() {
    FirebaseFirestore.instance.collection(kAdmin).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        if (element.data()['id'] != userName) {
          showSnackBar(context, 'your name is wrong');
        }
        if (element.data()['password'] != password) {
          showSnackBar(context, 'your password is wrong');
        }
        if (element.data()['id'] == userName &&
            element.data()['password'] == password) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeAdminPage()));
        }
      });
    });
  }
}
