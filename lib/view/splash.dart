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
    return Scaffold(
      backgroundColor: Colors.white, // Use a white background
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              'assets/splash_images/splash.png'), // Adjust image path as needed
          Column(
            children: [
              Text(
                'Your Health,',
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w600), // Use AppColors for styling
              ),
              Text(
                'One Tap Away',
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Connect with Specialized Doctors for your time &',
                style: TextStyle(
                    color: AppColors.blue50,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Comprehensive Medical Consultations.',
                style: TextStyle(
                    color: AppColors.blue50,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                // Handle button tap
                Get.toNamed('/homepage'); // Navigate to the next page
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    colors: [AppColors.bluegradient1, AppColors.bluegradient2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By signing up, you agree to our',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '&',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Privacy Policy.',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
