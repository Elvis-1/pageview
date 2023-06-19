import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pageview/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  int pageValue = 0;
  onPageChange(index) {
    setState(() {
      pageValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                onPageChange(index);
              },
              children: [
                _pageView(context, "first.jpg", pageController, pageValue),
                _pageView(context, "second.jpg", pageController, pageValue),
                _pageView(context, "third.jpg", pageController, pageValue),
              ],
            ),
            // dot indicator
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.09,
                child: DotsIndicator(
                    position: pageValue,
                    decorator: DotsDecorator(
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        activeColor: Colors.red,
                        activeSize: Size(18, 8),
                        color: Colors.black),
                    dotsCount: 3)),
          ],
        ),
      ),
    );
  }
}

Widget _pageView(BuildContext context, String image,
    PageController pageController, int page) {
  return Center(
    child: Stack(
      children: [
        // image
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "images/$image",
            fit: BoxFit.cover,
          ),
        ),
        // button
        Positioned(
            right: 5,
            bottom: MediaQuery.of(context).size.height * 0.08,
            child: GestureDetector(
              onTap: () {
                if (page + 1 < 3) {
                  pageController.animateToPage(page + 1,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn);
                } else {
                  // go to home screen
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Container(
                child: Icon(
                  Icons.chevron_right,
                  size: 100,
                ),
              ),
            ))
      ],
    ),
  );
}
