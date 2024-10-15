import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), // Use .w for responsive padding
            child: Image.asset(
              'assets/splash_images/splash.png',
              height: 370.h, // Example of responsive height
              // width: 370.w,  // Example of responsive width
            ),
          ),
          Column(
            children: [
              Text(
                'Your Health,',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 26.sp, // Responsive font size
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'One Tap Away',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 26.sp, // Responsive font size
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h), // Responsive spacing
          Column(
            children: [
              Text(
                'Connect with Specialized Doctors for your time &',
                style: TextStyle(
                  color: AppColors.blue50,
                  fontSize: 14.sp, // Responsive font size
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Comprehensive Medical Consultations.',
                style: TextStyle(
                  color: AppColors.blue50,
                  fontSize: 14.sp, // Responsive font size
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h), // Responsive spacing
          Column(
            children: [
              GestureDetector(
                
                onTap: () {
                  // Navigate to the next page
                  Get.toNamed('/customBottomNavBar');
                },
                child: Container(
                  width: 326.w, // Responsive width
                  height: 40.h, // Responsive height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r), // Responsive radius
                    gradient: LinearGradient(
                      colors: [
                        AppColors.bluegradient1,
                        AppColors.bluegradient2,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color:AppColors.white,
                        fontSize: 12.sp, // Responsive font size
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By signing up, you agree to our',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 8.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w), // Responsive spacing
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 8.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w), // Responsive spacing
                  Text(
                    '&',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 8.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w), // Responsive spacing
                  Text(
                    'Privacy Policy.',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 8.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
