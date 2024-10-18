import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController newpasscontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool confirmObscureText = true;
  bool isLoading = false;

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value != newpasscontroller.text) {
      return 'Passwords do not match';
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
          child: Center(
            child: SingleChildScrollView(
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
                    'Create new password',
                    style: TextStyle(
                        color: AppColors.blue6,
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Your new password must be different from previously used password",
                    style:
                        TextStyle(color: AppColors.grey2, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border:
                          Border.all(color:AppColors.blue7, width: 1),
                    ),
                    child: TextFormField(
                      controller: newpasscontroller,
                      obscureText: obscureText,
                      validator: validateField,
                      cursorColor: AppColors.blue7,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:AppColors.grey,
                          ),
                        ),
                        hintText: 'New password',
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                          color:AppColors.blue7, width: 1.w),
                    ),
                    child: TextFormField(
                      controller: confirmpasscontroller,
                      obscureText: confirmObscureText,
                      validator: validateField,
                      cursorColor: AppColors.blue7,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmObscureText = !confirmObscureText;
                            });
                          },
                          icon: Icon(
                            confirmObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Confirm new password',
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
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          // Simulate loading
                          await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            isLoading = false;
                          });
                          Get.offNamed('/LoginPage');
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$e'.toString())));
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
                                'Reset Password',
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
