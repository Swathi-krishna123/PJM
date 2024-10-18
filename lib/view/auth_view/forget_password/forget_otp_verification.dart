import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:pinput/pinput.dart';

class Forgetpasswordotp extends StatefulWidget {
  const Forgetpasswordotp({super.key});

  @override
  _ForgetpasswordotpState createState() => _ForgetpasswordotpState();
}

class _ForgetpasswordotpState extends State<Forgetpasswordotp> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final defaultPinTheme = PinTheme(
      width: 56.h,
      height: 60.w,
      textStyle: const TextStyle(color: Colors.black, fontSize: 18),
      decoration: BoxDecoration(
        color: AppColors.blue7.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Center(
            child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 75, sigmaY: 75),
                    child: SizedBox(
                      width: 60.w,
                      height: 54.w,
                      child: SvgPicture.asset(
                        'assets/icons/ghologo.svg',
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w),
                      child: Column(
                        children: [
                          SizedBox(height: 25.h),
                          Text(
                            'Verify OTP',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Enter the OTP",
                            style: TextStyle(color: Colors.grey.shade700),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "We just sent you on your registered email",
                            style: TextStyle(color: Colors.grey.shade700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 25.h),
                          Pinput(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              } else if (value.length != 6) {
                                return 'Enter a valid OTP of 6 digits';
                              } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                                return 'OTP should contain only numbers';
                              }
                              return null;
                            },
                            length: 6,
                            defaultPinTheme: defaultPinTheme.copyWith(
                                height: 46.h,
                                width: 46.w,
                                textStyle: TextStyle(
                                    color: AppColors.blue6,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.blue7,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r))),
                            focusedPinTheme: defaultPinTheme.copyWith(
                                height: 46.h,
                                width: 45.w,
                                textStyle: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                        color: AppColors.blue,
                                        border:
                                            Border.all(color: AppColors.blue7),
                                        borderRadius:
                                            BorderRadius.circular(4.r))),
                            onCompleted: (value) {
                              otpController.text = value;
                            },
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
              
                                // Simulate loading and perform your verification action here
                                await Future.delayed(const Duration(seconds: 2));
              
                                setState(() {
                                  isLoading = false;
                                });
              
                                Get.offNamed('/CreateNewPassword');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF065FD5),
                                    Color(0xFF064DAB),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: isLoading
                                    ? LoadingAnimationWidget.fourRotatingDots(
                                        color: Colors.white,
                                        size: 24.w,
                                      )
                                    : Text(
                                        'Verify',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18.sp),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Didn't get the code?  ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // Resend OTP action
                                },
                                child: Text(
                                  'Resend',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
