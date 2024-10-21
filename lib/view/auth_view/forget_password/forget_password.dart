import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Forgetpasswordemail extends StatefulWidget {
  const Forgetpasswordemail({super.key});

  @override
  _ForgetpasswordemailState createState() => _ForgetpasswordemailState();
}

class _ForgetpasswordemailState extends State<Forgetpasswordemail> {
  final TextEditingController emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/homepageimages/Sign Up.png',
                  fit: BoxFit.cover,
                )),

            // Login elements

            Positioned(
              top: size.height / 4,
              left: 25,
              right: 25,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 12,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: AppColors.headline,
                          fontWeight: FontWeight.w700,
                          fontSize: 32.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Enter your Email",
                        style: TextStyle(color: AppColors.grey2),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "We will send you a verification code.",
                        style: TextStyle(color: AppColors.grey2),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextFormField(
                          controller: emailcontroller,
                          cursorColor: AppColors.blue50,
                          validator: validateField,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            floatingLabelStyle:
                                TextStyle(color: AppColors.blue),
                            labelText: 'Your Email',
                            labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.labelcolor),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.white),
                                borderRadius: BorderRadius.circular(10.r)),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: AppColors.blue)),
                            contentPadding: EdgeInsets.all(12.w),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            // Simulate loading and perform necessary action here
                            await Future.delayed(const Duration(seconds: 2));

                            setState(() {
                              isLoading = false;
                            });

                            Get.toNamed('/Forgetpasswordotp');
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
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
                                    color: AppColors.white,
                                    size: 24.sp,
                                  )
                                : Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
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
