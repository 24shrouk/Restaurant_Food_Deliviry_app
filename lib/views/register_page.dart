import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/widgets/customButton.dart';
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
              CustomTextFormFiled(hint: 'User Name'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormFiled(hint: 'Phone'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormFiled(
                hint: 'Email',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormFiled(hint: 'Password'),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                text: 'Register',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
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
                      Navigator.pop(context);
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
    );
  }
}
