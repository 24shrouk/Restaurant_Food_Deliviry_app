import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/data/onboarding_list_data.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/views/register_page.dart';
import 'package:restaurant_app/widgets/custom_bottom_bar.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
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
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboardingList.length,
                  (index) => buildDot(index, context),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == onboardingList.length - 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              }
              _controller.nextPage(
                  duration: const Duration(microseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: kPrimaryColor,
              ),
              child: Center(
                child: Text(
                  currentIndex == onboardingList.length - 1 ? 'Start' : 'Next',
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index
            ? kPrimaryColor
            : const Color.fromARGB(255, 190, 190, 190),
      ),
      width: currentIndex == index ? 25 : 10,
      height: 10,
    );
  }
}
