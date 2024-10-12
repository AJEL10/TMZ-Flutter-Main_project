import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/view/signin_screen.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.main,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Added space around elements
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0), // Added padding
              child: Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, // Slightly smaller font size
                  fontWeight: FontWeight.w600, // Changed font weight
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                'lib/assets/img/logo.jpg',
                height: 150, // Adjusted image height
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(ScreenSignIn());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: UIColors.color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Changed button shape
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0), // Added padding for button
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18, // Slightly larger font size
                    fontWeight: FontWeight.w500, // Changed font weight
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
