import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/splash_images/splash.png',
            ),
          ),
          Column(
            children: [
              Text(
                'Your Health,',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'One Tap Away',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                'Connect with Specialized Doctors for your time &',
                style: TextStyle(
                  color: AppColors.blue50,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Comprehensive Medical Consultations.',
                style: TextStyle(
                  color: AppColors.blue50,
                  fontSize: 14, // Responsive font size
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  Get.toNamed('/customBottomNavBar');
                },
                child: Container(
                  width: 326,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.bluegradient1,
                        AppColors.bluegradient2
                      ],
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
