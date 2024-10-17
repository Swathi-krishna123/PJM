import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Column(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                color: AppColors.blue,
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                color: AppColors.background,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            SvgPicture.asset(
              'assets/icons/globalicon.svg',
              height: 40.h,
              width: 40.w,
            ),
            SizedBox(height: 20.h),
            Text(
              'Log In',
              style: TextStyle(
                  color: AppColors.white3,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      decorationColor: AppColors.white,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Container(
              height: 314.h,
              width: 327.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow, // Shadow color
                      offset: Offset(0.w, 10.h), // Offsets
                      blurRadius: 15.r, // Blur radius
                      spreadRadius: -3.r, // Spread radius
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46.h,
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 46.h,
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp)),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      height: 46.h,
                      width: 279.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
