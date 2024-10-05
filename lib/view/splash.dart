import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to Splash2
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const Splash2()); // Navigate after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/splash_images/Background.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size to adjust layouts based on screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Use a white background
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: screenHeight * 0.1), // Responsive top spacing
              
              // Image without resizing
              Container(
                height: screenHeight*0.5,
                child: Image.asset(
                  'assets/splash_images/splash.png',
                ),
              ),
              
              SizedBox(height: screenHeight * 0.03), // Responsive spacing between image and text
              
              // Text section with responsive font sizes
              Column(
                children: [
                  Text(
                    'Your Health,',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'One Tap Away',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              
              // Subtext with responsive font sizes
              Column(
                children: [
                  Text(
                    'Connect with Specialized Doctors for your time &',
                    style: TextStyle(
                      color: AppColors.blue50,
                      fontSize: screenWidth * 0.035, // Responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Comprehensive Medical Consultations.',
                    style: TextStyle(
                      color: AppColors.blue50,
                      fontSize: screenWidth * 0.035, // Responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              
              // Button with responsive padding and font size
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the next page
                      Get.toNamed('/customBottomNavBar');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive vertical padding
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          colors: [AppColors.bluegradient1, AppColors.bluegradient2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Spacing between button and disclaimer
                  
                  // Disclaimer text with responsive font sizes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By signing up, you agree to our',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: screenWidth * 0.02, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: screenWidth * 0.02, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '&',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: screenWidth * 0.02, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Privacy Policy.',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: screenWidth * 0.02, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: screenHeight * 0.1), // Bottom padding to add more space
            ],
          ),
        ),
      ),
    );
  }
}

