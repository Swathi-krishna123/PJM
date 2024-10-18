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
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60.w,
                height: 54.w,
                child: SvgPicture.asset(
                  'assets/icons/ghologo.svg',
                  color: AppColors.blue,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Forget Password?',
                style: TextStyle(
                  color: AppColors.blue6,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Enter your Email",
                style: TextStyle(color:AppColors.grey2),
                textAlign: TextAlign.center,
              ),
              Text(
                "We will send you a verification code.",
                style: TextStyle(color:AppColors.grey2),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color:AppColors.blue7, width: 1.w),
                ),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: validateField,
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 14.sp),
                    hintText: 'Enter your registered email',
                    enabledBorder: InputBorder.none,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(85.r)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(85.r)),
                    ),
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.r),
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
                            color:AppColors.white,
                            size: 24.sp,
                          )
                        : Text(
                            'Continue',
                            style: TextStyle(
                              color:AppColors.white,
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
    );
  }
}
