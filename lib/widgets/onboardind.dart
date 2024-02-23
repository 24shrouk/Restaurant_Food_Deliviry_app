import 'package:flutter/material.dart';
import 'package:restaurant_app/data/onboarding_list_data.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: onboardingList.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  onboardingList[index].image,
                  height: 300,
                  width: 300,
                ),
                Text(
                  onboardingList[index].title,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  onboardingList[index].content,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(239, 95, 93, 93),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          );
        });
  }
}
