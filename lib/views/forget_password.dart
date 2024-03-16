import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/views/register_page.dart';
import 'package:restaurant_app/widgets/customButton.dart';
import 'package:restaurant_app/widgets/customtextformfeild.dart';

class ForgerPassword extends StatefulWidget {
  const ForgerPassword({super.key});

  @override
  State<ForgerPassword> createState() => _ForgerPasswordState();
}

class _ForgerPasswordState extends State<ForgerPassword> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Forget Password',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormFiled(
              onChange: (data) {
                email = data;
              },
              hint: 'Email',
              prefIcon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {});
                    try {
                      resetPassword();
                      showSnackBar(
                          context, 'Password reset email has been sent');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email');
                      }
                    }
                  }
                },
                text: 'Send'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account ?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text(
                    ' Register',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 150, 59),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

  Future<void> resetPassword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
  }
}
