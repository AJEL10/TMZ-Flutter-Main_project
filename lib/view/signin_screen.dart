import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/login_controller.dart';

class ScreenSignIn extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: UIColors.main,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Changed alignment to center
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30), // Added padding to top
                child: Image.asset(
                  'lib/assets/img/logo.jpg',
                  height: 120, // Adjusted image size
                ),
              ),
              Container(
                height: screenHeight - 450, // Adjusted container height
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), // Changed corner radius
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0), // Modified padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Changed to start to shift content up
                    children: [
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200, // Slightly lighter fill color
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)), // Changed corner radius
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.grey.shade700), // Darker label color
                        ),
                        onChanged: (value) {
                          loginController.username.value = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey.shade700),
                        ),
                        onChanged: (value) {
                          loginController.password.value = value;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.grey.shade700, // Darker text color
                              fontSize: 14, // Slightly smaller font size
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30), // Added spacing
                      SizedBox(
                        width: double.infinity,
                        height: 55, // Adjusted button height
                        child: ElevatedButton(
                          onPressed: () {
                            loginController.validateLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Adjusted button shape
                            ),
                            backgroundColor: UIColors.color2,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Sign In', // Capitalized text
                            style: TextStyle(
                              fontSize: 22, // Adjusted font size
                              fontWeight: FontWeight.w600, // Added font weight
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Reduced spacing before "Sign up"
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: 'No account yet? ',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.normal, // Reduced font weight
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  color: UIColors.color2,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
