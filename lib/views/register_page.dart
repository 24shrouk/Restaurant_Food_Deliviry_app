import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/login_page.dart';
import 'package:restaurant_app/widgets/customButton.dart';
import 'package:restaurant_app/widgets/custom_bottom_bar.dart';
import 'package:restaurant_app/widgets/custom_cliper.dart';
import 'package:restaurant_app/widgets/customtextformfeild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String? email;
  String? password;
  int? phone;
  String? userName;

  bool isLoaded = false;
  bool obsecure = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Transform.translate(
                offset: Offset(0.0, 50 * (1 - _animation.value)),
                child: child,
              ),
            );
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: Containercliper(),
                    child: Container(
                      height: 230,
                      color: kPrimaryColor,
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormFiled(
                      onChange: (value) {
                        userName = value;
                      },
                      hint: 'User Name'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormFiled(
                      onChange: (value) {
                        phone = int.parse(value);
                      },
                      hint: 'Phone'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormFiled(
                    onChange: (value) {
                      email = value;
                    },
                    hint: 'Email',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormFiled(
                      onChange: (value) {
                        password = value;
                      },
                      icon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          if (obsecure) {
                            obsecure = false;
                            setState(() {});
                          } else {
                            obsecure = false;
                            setState(() {});
                          }
                        },
                      ),
                      obscurText: obsecure,
                      hint: 'Password'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    text: 'Register',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoaded = true;
                        setState(() {});

                        try {
                          await registerUser();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomBottombar()));
                          showSnackBar(context, 'create successfully');
                          // UserCredential user = await FirebaseAuth.instance
                          //     .createUserWithEmailAndPassword(
                          //   email: email!,
                          //   password: password!,
                          // );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(
                                context, 'The password provided is too weak.');
                            //  print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context,
                                'The account already exists for that email.');
                            //print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }

                        isLoaded = false;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account ?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 253, 150, 59),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(16),
        backgroundColor: const Color.fromARGB(255, 240, 231, 223),
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    FirebaseFirestore.instance.collection('Users').doc(user.user!.email).set({
      'userName': userName,
      'email': email,
      'phone': phone,
    });
  }
}
