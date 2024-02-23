import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_button_onboarding.dart';
import 'package:restaurant_app/widgets/custom_dot_onboarding.dart';
import 'package:restaurant_app/widgets/onboardind.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 4,
            child: OnboardingBody(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotOnboarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnboarding(),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
