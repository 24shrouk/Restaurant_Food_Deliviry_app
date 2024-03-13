import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/views/register_page.dart';
import 'package:restaurant_app/widgets/customButton.dart';
import 'package:restaurant_app/widgets/custom_cliper.dart';
import 'package:restaurant_app/widgets/customtextformfeild.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key}) ;
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
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
    return Scaffold(
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
        child: Column(
          children: [
            ClipPath(
              clipper: Containercliper(),
              child: Container(
                height: 300,
                color: kPrimaryColor,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            CustomTextFormFiled(
              hint: 'Email',
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormFiled(hint: 'Password'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Login',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            const SizedBox(
              height: 5,
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
            )
          ],
        ),
      ),
    ));
  }
}
